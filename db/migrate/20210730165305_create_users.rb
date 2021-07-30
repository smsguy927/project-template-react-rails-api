class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :user_name
      t.string :password
      t.boolean :admin
      t.string :email
      t.string :phone_number
      t.belongs_to :address, null: false, foreign_key: true

      t.timestamps
    end
  end
end
