class DoctorPatient < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient
  # validates :name, uniqueness: true
  # validates :booking_date, presence:true
  after_create :remind_doctor

  def remind_doctor
  	@doctor = Doctor.find(self.doctor_id)
  	UserMailer.appointment(@doctor, self.booking_date).deliver!
  end

end
