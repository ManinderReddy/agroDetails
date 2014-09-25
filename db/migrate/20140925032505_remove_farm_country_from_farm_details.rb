class RemoveFarmCountryFromFarmDetails < ActiveRecord::Migration
  def change
    remove_column :farm_details, :farm_country, :string
  end
end
