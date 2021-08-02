class CreatePropertyReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :property_reviews do |t|

      t.decimal :cleanliness, precision: 2, scale: 1
      t.decimal :accuracy, precision: 2, scale: 1
      t.decimal :communication, precision: 2, scale: 1
      t.decimal :location, precision: 2, scale: 1
      t.decimal :value, precision: 2, scale: 1
      t.string :comment
      t.integer :month
      t.integer :year
      t.integer :user_id, null: false, foreign_key: true
      t.integer :property_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
