class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|

      t.timestamps
      
      t.string :image_id
      t.string :facility_name
      t.string :address
      t.string :genre
      t.string :breakfast_existence
      t.integer :user_id
      t.text :review
      t.text :url
      t.datetime :created_at
      t.datetime :updated_at
      
    end
  end
end
