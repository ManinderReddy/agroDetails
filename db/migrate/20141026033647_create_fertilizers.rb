class CreateFertilizers < ActiveRecord::Migration
  def change
    create_table :fertilizers do |t|
      t.integer	:crop_id
      t.string 	:fertilizer_name
      t.date 		:fertilizer_added_on
      t.integer	:amount_of_fertilizer
      t.string 	:other_details

      t.timestamps
    end
  end
end
