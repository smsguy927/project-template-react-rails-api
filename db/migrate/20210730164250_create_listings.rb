class CreateListings < ActiveRecord::Migration[6.1]
  def change
    create_table :listings do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :property, null: false, foreign_key: true

      t.date :start_date
      t.date :end_date
      t.integer :price
      t.string :measurement
      t.timestamps
    end
  end
end
