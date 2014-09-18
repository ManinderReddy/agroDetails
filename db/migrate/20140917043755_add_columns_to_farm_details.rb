class AddColumnsToFarmDetails < ActiveRecord::Migration
  def change
    add_column :farm_details, :farm_city, :string
    add_column :farm_details, :farm_state, :string
    add_column :farm_details, :farm_country, :string
  end
end
