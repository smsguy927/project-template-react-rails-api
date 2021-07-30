# frozen_string_literal: true

class CreateUserReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :user_reviews do |t|
      t.decimal :general, precision: 2, scale: 1
      t.string :comment
      t.integer :month
      t.integer :year
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :property, null: false, foreign_key: true
      t.integer :reviewed_by, null: false, foreign_key: true
      t.timestamps
    end
  end
end
