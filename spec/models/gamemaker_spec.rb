require 'spec_helper'

describe Gamemaker do
  let(:plutarch) {Gamemaker.new("Plutarch Heavensbee")}
  let(:game) {plutarch.create_game("The 74th Annual Hunger Games")}

  describe "::new" do
    it "has a name" do 
      expect(plutarch.name).to eq("Plutarch Heavensbee")
    end
  end

  describe "#create_game" do
    it "creates a new Game instance" do
      expect(game).to be_an_instance_of(Game)
    end
  end

  describe "#start_reaping" do
    it "creates a new Reaper instance" do
      expect(plutarch.start_reaping(game)).to be_an_instance_of(Reaper)
    end
  end

end