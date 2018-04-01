class PatientsController < ApplicationController

	def available_doctors
		@doctors = Doctor.all
		@doctor_patients = DoctorPatient.all
		@booked_doctor_ids = @doctor_patients.map(&:doctor_id)
		@doctors = @doctors.where("id not in (?)", @booked_doctor_ids)
	end

	def bookings
	  @booked_infos = current_patient.doctor_patients.as_json
	  @booked_infos.each_with_index do |booked_info,index|
	  	@booked_infos[index]["doctor_name"] = Doctor.find(@booked_infos[index]["doctor_id"]).name
	  end
	end

	def show
		@patient = Patient.find(params[:id])
	end

end