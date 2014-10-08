class RemoveFarmIdFromCrops < ActiveRecord::Migration
  def change
  	remove_column :crops, :farm_id, :integer
  end
end
