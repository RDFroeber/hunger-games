class Escort < Citizen
  belongs_to :game
  has_many :tributes, foreign_key: :game_id, primary_key: :game_id
end