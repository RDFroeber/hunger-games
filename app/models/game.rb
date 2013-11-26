class Game < ActiveRecord::Base
  has_many :rounds

  validates :president, presence: true
  validates :name, presence: true

  after_save :prepare_for_game

  def prepare_for_game 
    gamemaker = Gamemaker.new(self)
    # gamemaker.some_method

    gamemaker
  end
end