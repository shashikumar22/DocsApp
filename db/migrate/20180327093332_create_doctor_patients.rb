class CreateDoctorPatients < ActiveRecord::Migration[5.1]
  def change
    create_table :doctor_patients do |t|
      t.references :doctor, foreign_key: true
      t.references :patient, foreign_key: true
      t.datetime :booking_date

      t.timestamps
    end
  end
end
