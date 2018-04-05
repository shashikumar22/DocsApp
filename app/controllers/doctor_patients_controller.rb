class DoctorPatientsController < ApplicationController

  before_action :set_doctor_patient, only: [:edit, :update, :destroy]

  def new
  	@doctor = Doctor.find(params[:doctor])
    booked_date = @doctor.doctor_patients.map(&:booking_date)
    gon.disabled_dates = booked_date
    @doctor_patient  = DoctorPatient.new
  end	

	def create
    @doctor = Doctor.find_by(first_name: params[:doc_name])
    if params[:booking_date].blank?
      flash.now[:danger] = "please select a date"
      render 'new'
    else 
      @doctor_patient = DoctorPatient.new(patient_id: current_patient.id, doctor_id: @doctor.id, 
                        booking_date: Date.parse(params[:booking_date]))
      if @doctor_patient.save
        flash[:success] = "you have successfully booked Dr.#{@doctor.first_name} on #{params[:booking_date]}
                           for consultation"
        redirect_to bookings_path                     
      end
    end                         
	end

  def edit
    # @doctor_patient = DoctorPatient.find(params[:id])
    @doctor = @doctor_patient.doctor
    # @doctor = Doctor.find(@doctor_patient[:doctor_id])
    # booked_date = DoctorPatient.where(:doctor_id => @doctor.id).map(&:booking_date)
    booked_date = @doctor.doctor_patients.map(&:booking_date)
    gon.disabled_dates = booked_date
  end

  def update
    # @doctor_patient = DoctorPatient.find(params[:id])
    if @doctor_patient.update(:booking_date => params[:booking_date])
      flash[:success] = "you have successfully booked Dr.#{@doctor_patient.doctor.name} on #{params[:booking_date]}
                           for consultation"
      redirect_to bookings_path 
    end                        
  end

  def destroy  
    # @doctor_patient = DoctorPatient.find(params[:id].to_i)
    if @doctor_patient.destroy
      flash[:success] = "you have appointment has been successfully cancelled"
    end
    redirect_to bookings_path
  end

  private

    def set_doctor_patient
      @doctor_patient = DoctorPatient.find(params[:id])
    end

end
