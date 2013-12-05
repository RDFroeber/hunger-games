require 'spec_helper'

describe Round do
  describe "validations" do
    it { should validate_presence_of(:game_id) }
  end

  describe "associations" do
    it { should belong_to(:game) }
  end
end