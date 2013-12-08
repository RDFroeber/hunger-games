class Citizen < ActiveRecord::Base
  belongs_to :district
  has_many :tributes, class_name: "Citizen"
  has_many :escorts, class_name: "Citizen"

  validates :district_id, :name, :gender, :age, presence: true
end