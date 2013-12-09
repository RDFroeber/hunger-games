class Gamemaker
  def initialize(name)
    @name = name
  end

  attr_reader :name, :create_game, :start_reaping

  def create_game(game_name)
    Game.new(president: "Coriolanus Snow", name: game_name)
  end

  def start_reaping(game)
    Reaper.new(game)
  end
end