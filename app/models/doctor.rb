class Doctor < ApplicationRecord
  belongs_to :hospital
  enum specialty: { neuro: 0, onco: 1, obgyn: 2 }
end
