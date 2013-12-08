class Tribute < Citizen
  belongs_to :game
  belongs_to :escort, foreign_key: :district_id, primary_key: :district_id
end