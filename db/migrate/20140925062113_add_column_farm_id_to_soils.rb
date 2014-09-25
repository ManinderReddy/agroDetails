class AddColumnFarmIdToSoils < ActiveRecord::Migration
  def change
    add_column :soils, :farm_id, :integer
  end
end
