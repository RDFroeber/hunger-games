class Tribute < Citizen
  belongs_to :game
  belongs_to :escort, foreign_key: :game_id, primary_key: :game_id
end