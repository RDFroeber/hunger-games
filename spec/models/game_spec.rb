require 'spec_helper'

describe Game do
  let(:game) {Game.new(president: "Coriolanus Snow", name: "The 73rd Annual Hunger Games")}

  it "is valid with a president and a name" do
    expect(game).to be_valid
  end

  it "is invalid without a president" do
    game.president = nil
    expect(game).to have(1).errors_on(:president)
  end

  it "is invalid without a name" do
    game.name = nil
    expect(game).to have(1).errors_on(:name)
  end

  describe "it has many relationships" do
    before {game.save}

    it "it can have many rounds" do
      game.rounds << Round.new(game: game)
      expect(game.rounds.first).to be_an_instance_of(Round)
    end

    # it "it can have many tributes" do
    #   expect(game.tributes.first).to be_an_instance_of(Tribute)
    # end
  end
end