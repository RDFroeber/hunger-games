class Game < ActiveRecord::Base
  has_many :rounds
  has_many :tributes
  has_many :escorts

  validates :president, :name, presence: true
end