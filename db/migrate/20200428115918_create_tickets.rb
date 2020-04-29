# frozen_string_literal: true

class CreateTickets < ActiveRecord::Migration[6.0]
  def change
    create_table :tickets do |t|
      t.string :request_number, unique: true, null: false
      t.string :sequence_number, null: false
      t.integer :request_type, null: false
      t.timestamp :response_due_date, null: false
      t.string :primary_service_area, null: false
      t.string :additional_service_area, array: true
      t.string :digsite_info, null: false

      t.timestamps
    end
  end
end
