require 'spec_helper'

describe District do
  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:industry) }
  end

  describe "associations" do
    it { should have_many(:citizens) }
    it { should have_many(:tributes) }
  end
end