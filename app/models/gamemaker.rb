class Gamemaker
  def initialize(game)
    @game = game
  end

  attr_reader :game

  def commence_reaping
    reapees = Citizen.all.where()

  end
end