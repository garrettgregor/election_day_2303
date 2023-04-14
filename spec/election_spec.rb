require "spec_helper"

RSpec.describe Election do
  before(:each) do 
    @election2023 = Election.new("2023")
    @race = Race.new("Texas Governor")
    @candidate1 = @race.register_candidate!({name: "Diana D", party: :democrat})
    @candidate2 = @race.register_candidate!({name: "Roberto R", party: :republican})
  end
  
  describe "initialize" do
    it "exists and has attributes" do
      expect(@election2023.class).to eq(Election)
      expect(@election2023.year).to eq("2023")
      expect(@election2023.races).to be_an Array
      expect(@election2023.candidates).to be_an Array
      expect(@election2023.vote_counts).to be_a Hash
    end
  end

  describe "add_race" do
    it "adds races to the election" do
      expect(@election2023.add_race(@race)).to be_an Array
      expect(@election2023.races).to eq([@race])
    end
  end
end