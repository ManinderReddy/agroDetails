class ChangePhoneNoTypeOfUsers < ActiveRecord::Migration
  def change
  	change_column :users, :phone_no, :bigint
  end
end
