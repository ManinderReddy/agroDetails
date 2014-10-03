class AddColumnSoilTypeToFarmDetails < ActiveRecord::Migration
  def change
    add_column :farm_details, :soil_type, :string
  end
end
