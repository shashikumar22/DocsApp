class DoctorPatientsController < ApplicationController
  def new
  	@doctor = Doctor.find(params[:doctor])
  	@doctor_patient  = DoctorPatient.new
  end	

	def create
    @doctor = Doctor.find_by(name: params[:doc_name])
    if params[:booking_date].blank?
      flash.now[:danger] = "please select a date"
      render 'new'
    else 
      @doctor_patient = DoctorPatient.new(patient_id: current_patient.id, doctor_id: @doctor.id, 
                        booking_date: Date.parse(params[:booking_date]))
      if @doctor_patient.save
        flash[:success] = "you have successfully booked Dr.#{@doctor.name} on #{params[:booking_date]}
                           for consultation"
        redirect_to bookings_path                     
      end
    end                         
	end

  def edit
    @doctor_patient = DoctorPatient.find(params[:id])
    @doctor = Doctor.find(@doctor_patient[:doctor_id])
  end

  def update
    @doctor_patient = DoctorPatient.find(params[:id])
    byebug
    if @doctor_patient.update(:booking_date => params[:booking_date])
      flash[:success] = "you have successfully booked Dr.#{@doctor_patient.doctor.name} on #{params[:booking_date]}
                           for consultation"
      redirect_to bookings_path 
    end                        
  end

  def destroy  
    @doctor_patient = DoctorPatient.find(params[:id].to_i)
    if @doctor_patient.destroy
      flash[:success] = "you have appointment has been successfully cancelled"
    end
    redirect_to bookings_path
  end

end