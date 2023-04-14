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
    
    it "ensures all candidates from all races are added to election candidates" do
      @election2023.add_race(@race)
      expect(@election2023.candidates).to eq([@candidate1, @candidate2])
    end
    
    it "counts votes of all candidates added to election" do
      @candidate1.vote_for!
      @candidate1.vote_for!
      @candidate1.vote_for!
      @candidate2.vote_for!
      @election2023.add_race(@race)

      expect(@election2023.vote_counts).to eq({
        "Diana D"=>3, 
        "Roberto R"=>1
      })
    end
  end
end