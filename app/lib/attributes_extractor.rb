# frozen_string_literal: true

class AttributesExtractor
  attr_reader :json

  def initialize(json)
    @json = json
  end

  def ticket
    {
      request_number: request_number,
      sequence_number: sequence_number,
      request_type: request_type,
      response_due_date: response_due_date,
      primary_service_area: primary_service_area,
      additional_service_area: additional_service_area,
      digsite_info: digsite_info
    }
  end

  def excavator
    {
      company_name: company_name,
      address: address,
      crew_on_site: crew_on_site
    }
  end

  private

  def request_number
    json['RequestNumber']
  end

  def sequence_number
    json['SequenceNumber']
  end

  def request_type
    json['RequestType'].downcase
  end

  def response_due_date
    json['DateTimes']['ResponseDueDateTime']
  end

  def primary_service_area
    json['ServiceArea']['PrimaryServiceAreaCode']['SACode']
  end

  def additional_service_area
    json['ServiceArea']['AdditionalServiceAreaCodes']['SACode']
  end

  def digsite_info
    json['ExcavationInfo']['DigsiteInfo']['WellKnownText']
  end

  def company_name
    json['Excavator']['CompanyName']
  end

  def address
    json['Excavator']['Address']
  end

  def crew_on_site
    ActiveModel::Type::Boolean.new.cast(json['Excavator']['CrewOnsite'])
  end
end
