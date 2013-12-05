class Escort < Citizen
  belongs_to :game
  has_many :tributes
end