class School < ApplicationRecord
  validates_presence_of :name, :address, :principal, :capacity, :private_school
  
  has_many :students
end
