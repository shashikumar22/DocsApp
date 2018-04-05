class PatientsController < ApplicationController

	def available_doctors
		@doctors = Doctor.all
		if !params[:booking_date].present?
    	params[:booking_date] = Date.today
    else
    	params[:booking_date] = Date.parse(params[:booking_date])	
    end
		@booked_doctor_ids = DoctorPatient.where(booking_date: params[:booking_date]).map(&:doctor_id)
		if @booked_doctor_ids.count > 0
			@doctors = @doctors.where("id not in (?)", @booked_doctor_ids)
		else
			@doctors
		end

		respond_to do |format|
			format.html { render 'available_doctors'}
    	format.js {}
  	end
	end

	def bookings
	  @booked_infos = current_patient.doctor_patients.as_json
	  @booked_infos.each_with_index do |booked_info, index|
	  	@booked_infos[index]["doctor_name"] = Doctor.find(booked_info["doctor_id"]).first_name
	  end
	end

	def show
		@patient = Patient.find(params[:id])
	end

end