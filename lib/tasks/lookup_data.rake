
namespace :db do
  desc "Populate db with lookup data"
  task populate_lookup: :environment do
    
    LookupField.create!(lookup_type: 'SOIL_PH', lookup_value: '-1 to 5.5', other_details: 'Acidic')
    LookupField.create!(lookup_type: 'SOIL_PH', lookup_value: '5.5 to 7', other_details: 'Neuteral')
    LookupField.create!(lookup_type: 'SOIL_PH', lookup_value: '7 to 14', other_details: 'Alkaline')

    LookupField.create!(lookup_type: 'SOILTEXTURES', lookup_value: 'Gravel', other_details: '')
    LookupField.create!(lookup_type: 'SOILTEXTURES', lookup_value: 'Sand', other_details: '')
    LookupField.create!(lookup_type: 'SOILTEXTURES', lookup_value: 'Slit', other_details: '')
    LookupField.create!(lookup_type: 'SOILTEXTURES', lookup_value: 'Clay', other_details: '')

    LookupField.create!(lookup_type: 'SOILTYPES', lookup_value: 'Alluvial', other_details: '')
    LookupField.create!(lookup_type: 'SOILTYPES', lookup_value: 'Black', other_details: '')
    LookupField.create!(lookup_type: 'SOILTYPES', lookup_value: 'Laterite', other_details: '')
    LookupField.create!(lookup_type: 'SOILTYPES', lookup_value: 'Mountain', other_details: '')
    LookupField.create!(lookup_type: 'SOILTYPES', lookup_value: 'Desert', other_details: '')
    LookupField.create!(lookup_type: 'SOILTYPES', lookup_value: 'Red', other_details: '')
    LookupField.create!(lookup_type: 'SOILTYPES', lookup_value: 'Yellow', other_details: '')
    LookupField.create!(lookup_type: 'SOILTYPES', lookup_value: 'Other', other_details: '')

    LookupField.create!(lookup_type: 'QUANTITY', lookup_value: 'High', other_details: '')
    LookupField.create!(lookup_type: 'QUANTITY', lookup_value: 'Medium', other_details: '')
    LookupField.create!(lookup_type: 'QUANTITY', lookup_value: 'Low', other_details: '')


    LookupField.create!(lookup_type: 'CROPNAMES', lookup_value: 'Rice', other_details: '')
    LookupField.create!(lookup_type: 'CROPNAMES', lookup_value: 'Wheat', other_details: '')
    LookupField.create!(lookup_type: 'CROPNAMES', lookup_value: 'Sugarcane', other_details: '')
    LookupField.create!(lookup_type: 'CROPNAMES', lookup_value: 'Cotton', other_details: '')
    LookupField.create!(lookup_type: 'CROPNAMES', lookup_value: 'Red Chilly', other_details: '')
    LookupField.create!(lookup_type: 'CROPNAMES', lookup_value: 'Onion', other_details: '')
    LookupField.create!(lookup_type: 'CROPNAMES', lookup_value: 'Jute', other_details: '')
    LookupField.create!(lookup_type: 'CROPNAMES', lookup_value: 'Groundnut', other_details: '')
    LookupField.create!(lookup_type: 'CROPNAMES', lookup_value: 'Millet', other_details: '')
    LookupField.create!(lookup_type: 'CROPNAMES', lookup_value: 'Oilseeds', other_details: '')
    LookupField.create!(lookup_type: 'CROPNAMES', lookup_value: 'Barley', other_details: '')
    LookupField.create!(lookup_type: 'CROPNAMES', lookup_value: 'Cashew', other_details: '')
    LookupField.create!(lookup_type: 'CROPNAMES', lookup_value: 'Rubber', other_details: '')
    LookupField.create!(lookup_type: 'CROPNAMES', lookup_value: 'Coconut', other_details: '')
    LookupField.create!(lookup_type: 'CROPNAMES', lookup_value: 'Tea', other_details: '')
    LookupField.create!(lookup_type: 'CROPNAMES', lookup_value: 'Coffee', other_details: '')
    LookupField.create!(lookup_type: 'CROPNAMES', lookup_value: 'Spices', other_details: '')
    LookupField.create!(lookup_type: 'CROPNAMES', lookup_value: 'Tropical fruits', other_details: '')
    LookupField.create!(lookup_type: 'CROPNAMES', lookup_value: 'Ragi', other_details: '')
    LookupField.create!(lookup_type: 'CROPNAMES', lookup_value: 'Potato', other_details: '')

    LookupField.create!(lookup_type: 'SOIL_BIOTA', lookup_value: 'Earthworm', other_details: '')
    LookupField.create!(lookup_type: 'SOIL_BIOTA', lookup_value: 'Roundworms', other_details: '')
    LookupField.create!(lookup_type: 'SOIL_BIOTA', lookup_value: 'Bacteria', other_details: '')
    LookupField.create!(lookup_type: 'SOIL_BIOTA', lookup_value: 'Fungi', other_details: '')
    LookupField.create!(lookup_type: 'SOIL_BIOTA', lookup_value: 'Cattle grazing', other_details: '')

    LookupField.create!(lookup_type: 'SEASON', lookup_value: 'Summer', other_details: '')
    LookupField.create!(lookup_type: 'SEASON', lookup_value: 'Spring', other_details: '')
    LookupField.create!(lookup_type: 'SEASON', lookup_value: 'Fall', other_details: '')

    LookupField.create!(lookup_type: 'FERTILIZERS', lookup_value: 'Sodium Nitrates', other_details: '')
    LookupField.create!(lookup_type: 'FERTILIZERS', lookup_value: 'Ammonium Sulphate', other_details: '')
    LookupField.create!(lookup_type: 'FERTILIZERS', lookup_value: 'Ammonium Nitrate', other_details: '')
    LookupField.create!(lookup_type: 'FERTILIZERS', lookup_value: 'Ammonium Sulphate Nitrate', other_details: '')
    LookupField.create!(lookup_type: 'FERTILIZERS', lookup_value: 'Ammonium Chloride', other_details: '')
    LookupField.create!(lookup_type: 'FERTILIZERS', lookup_value: 'Urea', other_details: '')
    LookupField.create!(lookup_type: 'FERTILIZERS', lookup_value: 'Organic Nitrogenous Fertilizer', other_details: '')
    LookupField.create!(lookup_type: 'FERTILIZERS', lookup_value: 'Rock Phosphate', other_details: '')
    LookupField.create!(lookup_type: 'FERTILIZERS', lookup_value: 'Superphosphate', other_details: '')
    LookupField.create!(lookup_type: 'FERTILIZERS', lookup_value: 'Bonemeal', other_details: '')
    LookupField.create!(lookup_type: 'FERTILIZERS', lookup_value: 'Slag', other_details: '')
    LookupField.create!(lookup_type: 'FERTILIZERS', lookup_value: 'Muriate of potash', other_details: '')
    LookupField.create!(lookup_type: 'FERTILIZERS', lookup_value: 'Sulphate of potash', other_details: '')



  end
  
end

