class AddFarmDetaillIdToCrops < ActiveRecord::Migration
  def change
    add_column :crops, :farm_detail_id, :integer
  end
end
