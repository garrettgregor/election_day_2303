require "spec_helper"

RSpec.describe Election do
  before(:each) do 
    @election = Election.new("2023")
    @race = Race.new("Texas Governor")
    @candidate1 = @race.register_candidate!({name: "Diana D", party: :democrat})
    @candidate2 = @race.register_candidate!({name: "Roberto R", party: :republican})
  end
  
  describe "initialize" do
    it "exists and has attributes" do
      expect(@election.class).to eq(Election)
      expect(@election.year).to eq("2023")
      expect(@election.races).to be_a Array
      expect(@election.candidates).to be_a Array
      expect(@election.vote_counts).to be_a Hash
    end
  end

  describe "add_race" do
    it "adds races to the election" do
      expect(@election.add_race(@race)).to be_an Array
      expect(@election.races).to eq([@race])
    end
    
    it "ensures all candidates from all races are added to election candidates" do
      @election.add_race(@race)
      
      expect(@election.candidates).to eq([@candidate1, @candidate2])
    end
    
    it "counts votes of all candidates added to election" do
      @election.add_race(@race)
      @candidate1.vote_for!
      @candidate1.vote_for!
      @candidate1.vote_for!
      @candidate2.vote_for!

      expect(@election.vote_counts).to eq({
        "Diana D"=>3, 
        "Roberto R"=>1
      })
    end
  end
end