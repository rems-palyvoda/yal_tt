# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Excavator, type: :model do
  it { should have_db_index(:ticket_id) }

  describe 'relations' do
    it { is_expected.to belong_to :ticket }
  end

  describe 'validations' do
    it { should validate_presence_of(:ticket_id) }
    it { should validate_presence_of(:company_name) }
    it { should validate_presence_of(:address) }
    it { should validate_presence_of(:crew_on_site) }
  end
end
