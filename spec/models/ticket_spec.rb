# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Ticket, type: :model do
  it { is_expected.to have_one :excavator }

  it { should define_enum_for(:request_type).with_values(%i[normal]) }
end
