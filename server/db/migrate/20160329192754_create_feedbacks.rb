class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.integer :user_id
      t.string :name
      t.integer :safety
      t.integer :cleanliness
      t.integer :comfort
      t.integer :friendliness
      t.integer :beauty
      t.integer :transportation
      t.string :info
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
  end
end
