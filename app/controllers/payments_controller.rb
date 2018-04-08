class PaymentsController < ApplicationController
	after_action :check_Payment, only: [:create]
  def new
		@doctor = Doctor.find_by(first_name: params[:doc_name])
  end

  def create
    # byebug
    @payment = Payment.new(doctor_name: params[:doc_name], patient_name: current_patient.first_name)
  end

  private

  	def check_Payment
  		byebug
  	end    
end
