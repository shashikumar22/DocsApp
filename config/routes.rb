Rails.application.routes.draw do
  get 'payments/new'

  get 'payments/create'

  devise_for :patients, :controllers => {:registrations => "patient/registrations"}
  devise_for :doctors, :controllers => {:registrations => "doctor/registrations"}
  get 'available_doctors', to: 'patients#available_doctors'
  get 'bookings', to: 'patients#bookings'
  get 'list_patient', to: 'doctors#list_patient'
  get 'list_specilization', to: 'patients#list_specilization'
  resources :doctor_patients
  resources :patients, only: [:show]
  resources :doctors, only: [:show]
  root 'home#choose_user'
  resources :payments
end