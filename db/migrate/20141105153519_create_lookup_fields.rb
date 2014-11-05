class CreateLookupFields < ActiveRecord::Migration
  def change
    create_table :lookup_fields do |t|

    	t.string :lookup_type
    	t.string :lookup_value
    	t.text   :other_details
    	
      t.timestamps
    end
  end
end
