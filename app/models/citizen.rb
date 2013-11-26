class Citizen < ActiveRecord::Base
  validates :district_id, :name, :gender, :age, presence: true

end