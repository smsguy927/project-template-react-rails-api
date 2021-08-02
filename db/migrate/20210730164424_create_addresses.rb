class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.integer :user_id, null: false, foreign_key: true

      t.string :street
      t.string :city
      t.string :state
      t.string :zip_code

      t.timestamps
    end
  end
end
