# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AttributesExtractor do
  let(:json) { test_json }
  let(:extractor) { described_class.new(json) }
  let(:expected_ticket) do
    {
      additional_service_area: %w[ZZL01 ZZL02 ZZL03],
      digsite_info: 'POLYGON((-81.13390268058475 32.07206917625161,-81.14660562247929 32.04064386441295,-81.08858407706913 32.02259853170128,-81.05322183341679 32.02434500961698,-81.05047525138554 32.042681017283066,-81.0319358226746 32.06537765335268,-81.01202310294804 32.078469305179404,-81.02850259513554 32.07963291684719,-81.07759774894413 32.07090546831167,-81.12154306144413 32.08806865844325,-81.13390268058475 32.07206917625161))',
      primary_service_area: 'ZZGL103',
      request_number: '09252012-00001',
      request_type: 'normal',
      response_due_date: '2011/07/13 23:59:59',
      sequence_number: '2421'
    }
  end
  let(:expected_excavator) do
    {
      address: '555 Some RD',
      company_name: 'John Doe CONSTRUCTION',
      crew_on_site: true
    }
  end

  describe '.ticket' do
    subject { extractor.ticket }

    it { should be_a(Hash) }
    it { should eq(expected_ticket) }
  end

  describe '.excavator' do
    subject { extractor.excavator }

    it { should be_a(Hash) }
    it { should eq(expected_excavator) }
  end
end
