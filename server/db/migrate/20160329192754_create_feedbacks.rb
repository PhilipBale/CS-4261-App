class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.integer :user_id
      t.integer :safety
      t.integer :cleanliness
      t.integer :comfort
      t.string :info
      t.integer :recommend

      t.timestamps null: false
    end
  end
end
