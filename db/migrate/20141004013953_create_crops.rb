class CreateCrops < ActiveRecord::Migration
  def change
    create_table :crops do |t|
      t.integer :farm_id
      t.string  :crop_name
      t.integer :crop_acarage
      t.string  :season
      t.date    :from_date
      t.date    :to_date
      t.integer :expected_yeild
      t.integer :actual_yeild
      t.text    :Other_details
      t.timestamps
    end
  end
end
