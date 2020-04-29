# frozen_string_literal: true

class Excavator < ApplicationRecord
  validates :ticket_id, presence: true
  validates :company_name, presence: true
  validates :address, presence: true
  validates :crew_on_site, presence: true

  belongs_to :ticket, required: true
end
