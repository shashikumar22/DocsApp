Rails.application.routes.draw do
  devise_for :patients, :controllers => {:registrations => "patient/registrations"}
  devise_for :doctors, :controllers => {:registrations => "doctor/registrations"}
  get 'available_doctors', to: 'patients#available_doctors'
  get 'bookings', to: 'patients#bookings'
  get 'list_patient', to: 'doctors#list_patient'
  resources :doctor_patients
  resources :patients, only: [:show]
  resources :doctors, only: [:show]
	root 'home#choose_user'
end