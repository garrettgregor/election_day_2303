require "spec_helper"

RSpec.describe Candidate do
  before(:each) do 
    @diana = Candidate.new({name: "Diana D", party: :democrat})
  end

  describe "initialize" do
    it "exists and has attributes" do
      expect(@diana).to be_a(Candidate)
    end
  end
end