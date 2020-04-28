# frozen_string_literal: true

class CreateTickets < ActiveRecord::Migration[6.0]
  def change
    create_table :tickets do |t|
      t.integer :request_number
      t.integer :sequence_number
      t.integer :request_type
      t.timestamp :response_due_date
      t.string :primary_service_area
      t.string :additional_service_area, array: true
      t.string :digsite_info

      t.timestamps
    end
  end
end
