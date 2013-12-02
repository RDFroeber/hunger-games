require 'spec_helper'

describe Reaper do
  let(:reap) {Reaper.new}
  describe "#eligible_citizens" do
    it "finds all eligible citizens to be reaped" do
      expect(reap.eligible_citizens.sample).to be_an_instance_of(Citizen)
    end
  end

  describe "#multiply_tesserae" do
    it "increases eligible citizens' chances based on amount of tesserae" do
      expect(reap.multiply_tesserae.count).to be > (reap.eligible_citizens.count)
    end
  end

  describe "#select_tributes" do

    it "chooses 24 tributes" do
      expect(reap.select_tributes.count).to eq(24)
    end
  end
end