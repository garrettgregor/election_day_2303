require "spec_helper"

RSpec.describe Candidate do
  before(:each) do 
    @diana = Candidate.new({name: "Diana D", party: :democrat})
  end

  describe "initialize" do
    it "exists and has attributes" do
      expect(@diana).to be_a(Candidate)
      expect(@diana.name).to eq("Diana D")
      expect(@diana.party).to eq("Diana D")
    end
  end
end