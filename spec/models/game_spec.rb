require 'spec_helper'

describe Game do
  let(:game) {Game.new(president: "Coriolanus Snow", name: "The 73rd Annual Hunger Games")}

  describe "validations" do
    it { should validate_presence_of(:president) }
    it { should validate_presence_of(:name) }
  end

  describe "associations" do
    it { should have_many(:rounds) }
    it { should have_many(:tributes) }
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