class AddColumnFarmNameToFarmDetails < ActiveRecord::Migration
  def change
    add_column :farm_details, :farm_name, :string
  end
end
