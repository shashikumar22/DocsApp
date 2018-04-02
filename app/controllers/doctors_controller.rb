class DoctorsController < ApplicationController

	def list_patient
    @patients = Doctor.first.doctor_patients.where('extract(month from booking_date) = ?', Date.today.month).as_json
    @patients.each_with_index do |patient,index|
    	@patients[index]["patient_name"] = Patient.find(@patients[index]["patient_id"]).first_name
    end
	end

	def show
		@doctor = Doctor.find(params[:id])
	end	

end