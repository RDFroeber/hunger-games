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

  context "tributes have been reaped" do
    before {reap.select_tributes}
    let(:tribs) {reap.tributes}

    describe "#select_tributes" do

      it "chooses tributes" do
        tribs.each do |trib|
          expect(trib.type).to eq("Tribute")
        end
      end

      it "chooses 24 tributes" do
        expect(tribs.count).to eq(24)
      end

      it "selects 12 of each gender" do
        expect(tribs.select{|trib| trib.gender == "F"}.count).to eq(12)
        expect(tribs.select{|trib| trib.gender == "M"}.count).to eq(12)
      end

      it "selects 2 from each district" do
        grouped_tribs = tribs.group_by {|trib| trib.district_id}
        grouped_tribs.each do |district,arr| 
          expect(arr.count).to eq(2)
        end
      end
    end

    describe "#assign_escort" do
      # expect(tribs.first.escort).to be_an_instance_of(Escort)
    end
  end
end