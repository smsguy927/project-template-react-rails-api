class CreateProperties < ActiveRecord::Migration[6.1]
  def change
    create_table :properties do |t|

      t.string :name
      t.string :description
      t.integer :num_bedrooms
      t.integer :num_bathrooms
      t.integer :address_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
