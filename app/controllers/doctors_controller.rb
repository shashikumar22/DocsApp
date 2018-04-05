class DoctorsController < ApplicationController

	def list_patient
		@patients = current_doctor.doctor_patients
	end

	def show
		@doctor = Doctor.find(params[:id])
	end	

end