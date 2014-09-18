class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :first_name
      t.string  :last_name
      t.integer :age
      t.integer :phone_no
      t.string  :email
      t.string  :address
      t.string  :city
      t.string  :state
      t.string  :country

      t.timestamps
    end
  end
end
