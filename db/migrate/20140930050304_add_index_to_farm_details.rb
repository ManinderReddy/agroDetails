class AddIndexToFarmDetails < ActiveRecord::Migration
  def change
  	add_index :farm_details, :farm_name, unique: true
  end
end
