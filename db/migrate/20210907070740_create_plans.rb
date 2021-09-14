class CreatePlans < ActiveRecord::Migration[5.0]
  def change
    create_table :plans do |t|

      t.timestamps
      
      t.datetime :time
      t.text :schedule
      t.string :meal
      t.string :city_name
      t.string :lodgment_target_name
      t.integer :user_id
      t.datetime :created_at
      t.datetime :updated_at
      
    end
  end
end