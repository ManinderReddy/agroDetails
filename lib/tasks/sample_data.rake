require 'faker'

namespace :db do
   desc "Populate db with sample data"
   task populate: :environment do
      Rake::Task["db:reset"].invoke
      user = User.create!(first_name: "Mani",
                          last_name: "Reddy",
                          age: 24,
                          phone_no: 1234567890,
                          address: "Long Beach",
                          city: "Long Beach",
                          state: "MS",
                          country: "USA",
                          email: "raja@1234.com",
                          password: "raja123",
                          password_confirmation: "raja123")
      
      9.times do |n|

        first_name  = Faker::Name.first_name,
        last_name   = Faker::Name.last_name,
        age         = Faker::Number.number(2),
        phone_no    = Faker::PhoneNumber.phone_number,
        address     = Faker::Address.street_address,
        city        = Faker::Address.city,
        state       = Faker::Address.state,
        country     = Faker::Address.country,
        email       = Faker::Internet.safe_email,
        password    = Faker::Password.password(7)

        User.create!(first_name:          first_name,
                    last_name:            last_name,
                    age:                  age,
                    phone_no:             phone_no,
                    address:              address,
                    city:                 city,
                    state:                state,
                    country:              country,
                    email:                email,
                    password:             password,
                    password_confirmation:password)         
         end
         
      User.all(limit: 3).each do |user|
        3.times do
          farm_area         = Faker::Number.number(2)
          farm_address      = Faker::Address.street_address + Faker::Address.city + Faker::Address.state
          farm_description  = "This farm is located at #{farm_address}"
          user.farm_details.create!(farm_area:        farm_area,
                                    farm_address:     farm_address,
                                    farm_description: farm_description)
        end
      end
      
   end   
end

