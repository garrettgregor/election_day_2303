require "spec_helper"

RSpec.describe Race do
  before(:each) do 
    @race = Race.new("Texas Governor")
  end
  
  describe "initialize" do
    it "exists and has attributes" do
      expect(@race).to be_a(Race)
      expect(@race.office).to eq("Texas Governor")
      expect(@race.candidates).to eq([])
    end
  end
  
  describe "register_candidate!" do
    it "registers a candidate for the race" do
      candidate1 = @race.register_candidate!({name: "Diana D", party: :democrat})

      expect(candidate1.class).to be Candidate
      expect(candidate1.class).to eq(Candidate)
      # can't use be_a, be_an, or be_an_instance_of because it is not an instance 
      expect(candidate1.name).to eq("Diana D")
      expect(candidate1.party).to eq(:democrat)
    end
  end
end