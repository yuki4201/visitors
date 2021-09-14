class CreatePlans < ActiveRecord::Migration[5.0]
  def change
    create_table :plans do |t|

      t.timestamps
      
      t.integer :time
      t.text :schedule
      t.string :meal
      t.string :city_name
      t.string :lodgment_target_name
      t.datetime :created_at
      t.datetime :updated_at
      
    end
  end
end