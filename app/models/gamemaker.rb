class Gamemaker
  def initialize(game)
    @game = game
  end

  attr_reader :game

  def reap_citizens
    reapees = Citizen.all.where(age: 12..18, tesserae: 1..30)
    # 1 F and 1 M from each district
  end
end