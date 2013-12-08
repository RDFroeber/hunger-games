class Escort < Citizen
  belongs_to :game
  has_many :tributes, foreign_key: :district_id, primary_key: :district_id
end