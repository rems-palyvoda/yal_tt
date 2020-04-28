# frozen_string_literal: true

class Ticket < ApplicationRecord
  enum request_type: { normal: 0 }

  has_one :excavator
end
