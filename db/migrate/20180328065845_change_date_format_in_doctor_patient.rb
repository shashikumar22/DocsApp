class ChangeDateFormatInDoctorPatient < ActiveRecord::Migration[5.1]
  def up
  	change_column :doctor_patients, :booking_date, :date 
  end

  def down
    change_column :doctor_patients, :booking_date, :datetime
  end
end
