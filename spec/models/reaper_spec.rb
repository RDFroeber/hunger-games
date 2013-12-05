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

    it "selects 12 of each gender" do
      expect(reap.select_tributes.select{|trib| trib.gender == "F"}.count).to eq(12)
      expect(reap.select_tributes.select{|trib| trib.gender == "M"}.count).to eq(12)
    end

    it "selects 2 from each district" do
      grouped_tribs = reap.select_tributes.group_by {|trib| trib.district_id}
      grouped_tribs.each do |district,arr| 
        expect(arr.count).to eq(2)
      end
    end
  end
end