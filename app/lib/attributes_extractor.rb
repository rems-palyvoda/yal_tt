# frozen_string_literal: true

class PostBodyError < StandardError; end

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
    json.dig('RequestNumber')
  end

  def sequence_number
    json.dig('SequenceNumber')
  end

  def request_type
    attr = json.dig('RequestType')
    attr.downcase if attr
  end

  def response_due_date
    json.dig('DateTimes', 'ResponseDueDateTime')
  end

  def primary_service_area
    json.dig('ServiceArea', 'PrimaryServiceAreaCode', 'SACode')
  end

  def additional_service_area
    json.dig('ServiceArea', 'AdditionalServiceAreaCodes', 'SACode')
  end

  def digsite_info
    json.dig('ExcavationInfo', 'DigsiteInfo', 'WellKnownText')
  end

  def company_name
    json.dig('Excavator', 'CompanyName')
  end

  def address
    json.dig('Excavator', 'Address')
  end

  def crew_on_site
    attr = json.dig('Excavator', 'CrewOnsite')
    ActiveModel::Type::Boolean.new.cast(attr)
  end
end
