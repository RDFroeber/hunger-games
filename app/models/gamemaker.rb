class Gamemaker
  def initialize
    @game = Game.new
  end

  attr_reader :game

  def start_reaping
     Reaper.new(game.id)
  end
  # def reap_citizens
  #   tess_max = Citizen.maximum(:tesserae)
  #   reapees = Citizen.where(age: 12..18, tesserae: 1..tess_max)
  #   # 1 F and 1 M from each district
  # end
end