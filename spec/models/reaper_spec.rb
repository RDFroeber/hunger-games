require 'spec_helper'

describe Reaper do
  let(:game) {Game.new(president: "Coriolanus Snow", name: "The 73rd Annual Hunger Games")}
  let(:reap) {Reaper.new(game)}

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

  context "tributes are reaped and escorts assigned" do
    before {reap.select_tributes}
    let(:tribs) { reap.tributes }

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
        # binding.pry
        grouped_tribs = tribs.group_by {|trib| trib.district_id}
        # binding.pry
        grouped_tribs.each do |district,arr| 
          expect(arr.count).to eq(2)
        end
      end

      it "removes each tribute's tesserae" do
        tribs.each do |trib|
          expect(trib.tesserae).to eq nil
        end
      end
    end

    describe "#increase_tesserae" do
      let(:sample_citizen) {reap.eligible_citizens.sample}
      let!(:tesserae) {sample_citizen.tesserae}
      before {reap.increase_tesserae}

      it "increases each eligible citizens' tesserae" do
        expect(sample_citizen.tesserae.to_i).to eq(tesserae.to_i + 1)
      end
    end

    describe "#select_escorts" do
    let(:escorts) {reap.escorts}

      it "chooses escorts" do
        escorts.each do |escort|
          expect(escort.type).to eq("Escort")
        end
      end

      it "chooses 12 escorts" do
        expect(escorts.count).to eq(12)
      end
    end

    describe "#assign_escort" do

      it "assigns an escort to each tribute" do
        tribs.each do |trib|
          expect(trib.escort).to_not eq nil
          expect(trib.escort.type).to eq("Escort")
        end
      end

      it "assigns the same escort to tributes from the same district" do
        expect(tribs[0].escort).to eq(tribs[1].escort)
        expect(tribs[2].escort).to eq(tribs[3].escort)
        expect(tribs[4].escort).to eq(tribs[5].escort)
        expect(tribs[6].escort).to eq(tribs[7].escort)
        expect(tribs[8].escort).to eq(tribs[9].escort)
        expect(tribs[10].escort).to eq(tribs[11].escort)
        expect(tribs[12].escort).to eq(tribs[13].escort)
      end
    end
  end

end