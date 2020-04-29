# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Ticket, type: :model do
  it { should have_db_index(:request_number) }

  describe 'enums' do
    it { should define_enum_for(:request_type).with_values(%i[normal]) }
  end

  describe 'relations' do
    it { is_expected.to have_one :excavator }
  end

  describe 'validations' do
    subject { create(:ticket) }

    it { should validate_presence_of(:request_number) }
    it { should validate_uniqueness_of(:request_number).case_insensitive }

    it { should validate_presence_of(:sequence_number) }

    it { should validate_presence_of(:response_due_date) }

    it { should validate_presence_of(:primary_service_area) }
    it { should allow_value('123ASD').for(:primary_service_area) }
    it { should_not allow_value('foo!!').for(:primary_service_area) }

    it { should validate_presence_of(:additional_service_area) }

    it { should validate_presence_of(:request_type) }

    it { should validate_presence_of(:digsite_info) }
  end
end
