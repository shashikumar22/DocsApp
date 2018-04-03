class AddTestToDoctorPatient < ActiveRecord::Migration[5.1]
  def change
  	add_column :doctor_patients, :test, :boolean
  end
end
