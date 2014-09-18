class CreateFarmDetails < ActiveRecord::Migration
  def change
    create_table 	:farm_details do |t|
      t.integer  	:user_id
      t.float    	:farm_area
      t.string 	:farm_address
      t.text 		:farm_description

      t.timestamps
    end
    add_index :farm_details, :user_id
  end
end
