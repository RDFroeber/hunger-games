class Round < ActiveRecord::Base
  belongs_to :game

  validates :game_id, presence: true
end