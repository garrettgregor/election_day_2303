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
      # => #<Candidate:0x00007f9edf376c90...>
      expect(candidate1.class).to be Candidate
      expect(candidate1.class).to eq(Candidate)
      # can't use be_a, be_an, or be_an_instance_of because it is not an instance of Candidate
      expect(candidate1.name).to eq("Diana D")
      expect(candidate1.party).to eq(:democrat)
    end
    
    it "can register multiple candidates and track those candidates" do
      candidate1 = @race.register_candidate!({name: "Diana D", party: :democrat})
      candidate2 = @race.register_candidate!({name: "Roberto R", party: :republican})
      # => #<Candidate:0x00007f9edf386780...>

      expect(@race.candidates).to eq([candidate1, candidate2])
      # => [#<Candidate:0x00007f9edf376c90...>, #<Candidate:0x00007f9edf386780...>]
    end
  end
end