class AddAddressAndPhoneNumberAndAgeToPatients < ActiveRecord::Migration[5.1]
  def change
  	add_column :patients, :address, :string
  	add_column :patients, :phone_no, :string
  	add_column :patients, :age, :integer
  end
end
