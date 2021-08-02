# frozen_string_literal: true

class CreatePropertyAmenities < ActiveRecord::Migration[6.1]
  def change
    create_table :property_amenities do |t|
      t.integer :property_id, null: false, foreign_key: true
      t.integer :amenity_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
