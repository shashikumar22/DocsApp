Rails.application.routes.draw do
	root 'patients#bookings'
  devise_for :patients, :controllers => {:registrations => "patient/registrations"}
  resources :doctors, only: [:show]
  get 'available_doctors', to: 'patients#available_doctors'
  get 'bookings', to: 'patients#bookings'
  get 'list_patient', to: 'doctors#list_patient'
  resources :doctor_patients
  resources :patients, only: [:show]
   resources :doctors, only: [:show]
end