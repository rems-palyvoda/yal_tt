# frozen_string_literal: true

class Ticket < ApplicationRecord
  enum request_type: { normal: 0 }

  has_one :excavator, dependent: :destroy

  validates :request_number, presence: true, uniqueness: true, case_sensitive: false
  validates :sequence_number, presence: true
  validates :response_due_date, presence: true
  validates :primary_service_area, presence: true,
                                   format: { with: /\A[a-zA-Z0-9]+\z/, message: 'Only letters and numbers.' }
  validates :additional_service_area, presence: true
  validates :request_type, presence: true, inclusion: %w[normal]
  validates :digsite_info, presence: true,
                           format: { with: /\APOLYGON\(\((-?\d{2}\.\d* -?\d{2}.\d*,?)*\)\)\z/,
                                     message: 'Wrong polygon format.' }
end
