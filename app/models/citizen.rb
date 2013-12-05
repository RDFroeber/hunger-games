class Citizen < ActiveRecord::Base
  belongs_to :district
  
  validates :district_id, :name, :gender, :age, presence: true
end