require 'spec_helper'

describe Citizen do
  let(:d) {District.all.sample}
  let(:girl) {Citizen.new(district: d, name: "LISA HORNER", gender: "F", age: 17)}

  describe "validations" do
    it { should validate_presence_of(:district_id) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:gender) }
    it { should validate_presence_of(:age) }
  end

  describe "associations" do
    it { should belong_to(:district) }
  end
end