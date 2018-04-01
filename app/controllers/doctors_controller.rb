class DoctorsController < ApplicationController

	def list_patient
    @patients = Doctor.first.doctor_patients.as_json
    @patients.each_with_index do |patient,index|
    	@patients[index]["patient_name"] = Patient.find(@patients[index]["patient_id"]).first_name
    end
	end

end