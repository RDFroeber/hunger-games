require 'spec_helper'

describe District do
  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:industry) }
  end
end