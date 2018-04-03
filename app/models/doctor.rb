class Doctor < ApplicationRecord
 devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable
    has_many :doctor_patients
    has_many :patients,through: :doctor_patients
end