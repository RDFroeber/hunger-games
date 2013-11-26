class Gamemaker
  def initialize(game)
    @game = game
  end

  attr_reader :game

  def reap_citizens
    reapees = Citizen.all.where(age: 12..18)
    
  end
end