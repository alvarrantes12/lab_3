class Doctor < ApplicationRecord
  belongs_to :hospital
  has_many :appointments
  has_many :patients, through: :appointments
  enum specialty: { neuro: 0, onco: 1, obgyn: 2 }
end
