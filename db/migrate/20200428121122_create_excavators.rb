# frozen_string_literal: true

class CreateExcavators < ActiveRecord::Migration[6.0]
  def change
    create_table :excavators do |t|
      t.string :company_name
      t.string :address
      t.boolean :crew_on_site
      t.belongs_to :ticket, index: { unique: true }, foreign_key: true

      t.timestamps
    end
  end
end
