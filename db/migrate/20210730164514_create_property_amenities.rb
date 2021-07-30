# frozen_string_literal: true

class CreatePropertyAmenities < ActiveRecord::Migration[6.1]
  def change
    create_table :property_amenities do |t|
      t.belongs_to :property, null: false, foreign_key: true
      t.belongs_to :amenity, null: false, foreign_key: true
      t.timestamps
    end
  end
end
