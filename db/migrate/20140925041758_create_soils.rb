class CreateSoils < ActiveRecord::Migration
  def change
    create_table :soils do |t|
      t.string :soil_type
      t.string :soil_texture
      t.string :water_availability
      t.string :soil_ph
      t.string :soil_biota
      t.string :season
      t.integer :year_of_details


      t.timestamps
    end
  end
end
