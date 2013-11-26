require 'spec_helper'

describe Round do
  describe "validations" do
    it { should validate_presence_of(:game_id) }
  end
end