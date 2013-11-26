class Game < ActiveRecord::Base
  has_many :rounds
  
  validates :president, presence: true
  validates :name, presence: true

end