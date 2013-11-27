class Gamemaker
  def initialize(game)
    @game = game
  end

  attr_reader :game

  def reap_citizens
    tess_max = Citizen.maximum(:tesserae)
    reapees = Citizen.where(age: 12..18, tesserae: 1..tess_max)
    # 1 F and 1 M from each district
  end
end