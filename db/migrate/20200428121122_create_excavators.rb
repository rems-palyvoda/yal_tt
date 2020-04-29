# frozen_string_literal: true

class CreateExcavators < ActiveRecord::Migration[6.0]
  def change
    create_table :excavators do |t|
      t.string :company_name, null: false
      t.string :address, null: false
      t.boolean :crew_on_site, null: false
      t.belongs_to :ticket, index: { unique: true }, foreign_key: true, null: false

      t.timestamps
    end
  end
end
