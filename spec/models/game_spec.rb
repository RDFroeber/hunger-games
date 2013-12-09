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
    it { should have_many(:escorts) }
  end

  context "the game has begun" do
    before {game.start_preliminaries}

    describe "#start_preliminaries" do
      it "each tribute should gain a skill" do
        game.tributes.each do |trib|
          expect(trib.skill).to_not eq nil
        end
      end

    end
  end
end