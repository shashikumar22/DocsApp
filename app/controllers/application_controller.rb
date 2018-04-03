class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
	  # check for the class of the object to determine what type it is
	  case resource.class
	  when Patient
	     bookings_path 
	  when Doctor
	    list_patient_path
	  end
	end
end
