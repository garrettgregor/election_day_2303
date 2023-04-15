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
      
      expect(candidate1.class).to eq(Candidate)
      expect(candidate1.name).to eq("Diana D")
      expect(candidate1.party).to eq(:democrat)
    end
    
    it "can register multiple candidates and track those candidates" do
      candidate1 = @race.register_candidate!({name: "Diana D", party: :democrat})
      candidate2 = @race.register_candidate!({name: "Roberto R", party: :republican})

      expect(@race.candidates).to eq([candidate1, candidate2])
    end
  end
  
  describe "open?" do
    it "checks whether a race is open" do
      expect(@race.open?).to be true
    end
  end
  
  describe "close" do
    it "closes a race" do
      expect(@race.open?).to be true

      @race.close!

      expect(@race.open?).to be false
    end
  end

  describe "winner" do
    before(:each) do
      @election = Election.new("2023")
      @race1 = Race.new("Texas Governor")
      @candidate1 = @race1.register_candidate!( { name: "Diana D", party: :democrat } )
      @candidate2 = @race1.register_candidate!( { name: "Roberto R", party: :republican } )
      @race2 = Race.new("Texas Governor")
      @candidate3 = @race2.register_candidate!( { name: "Debbie D", party: :democrat } )
      @candidate4 = @race2.register_candidate!( { name: "Ryan R", party: :republican } )
      @election.add_race(@race1)
      @election.add_race(@race2)
      @race3 = Race.new("Texas Governor")
      @candidate5 = @race3.register_candidate!( { name: "John D", party: :democrat } )
      @candidate6 = @race3.register_candidate!( { name: "Regina R", party: :republican } )
      @election.add_race(@race1)
      @election.add_race(@race2)
      @election.add_race(@race3)
  
      3.times { @candidate1.vote_for! }
      1.times { @candidate2.vote_for! }
      10.times { @candidate3.vote_for! }
      5.times { @candidate4.vote_for! }
      100.times { @candidate5.vote_for! }
      50.times { @candidate6.vote_for! }
  
      expected = {
        "Diana D" => 3, 
        "Roberto R" => 1,
        "Debbie D" => 10, 
        "Ryan R" => 5,
        "John D" => 100, 
        "Regina R" => 50
      }
    end
    it "can declare a winner if race is closed" do
      @race1.close!
      
      expect(@race1.winner).to eq(@candidate1)
    end
    
    it "can NOT declare a winner if race is NOT closed" do
      expect(@race1.winner).to be false
    end
  end
  describe "tie?" do
    before(:each) do
      @election = Election.new("2023")
      @race1 = Race.new("Texas Governor")
      @candidate1 = @race1.register_candidate!( { name: "Diana D", party: :democrat } )
      @candidate2 = @race1.register_candidate!( { name: "Roberto R", party: :republican } )
      @race2 = Race.new("Texas Governor")
      @candidate3 = @race2.register_candidate!( { name: "Debbie D", party: :democrat } )
      @candidate4 = @race2.register_candidate!( { name: "Ryan R", party: :republican } )
      @election.add_race(@race1)
      @election.add_race(@race2)
      @race3 = Race.new("Texas Governor")
      @candidate5 = @race3.register_candidate!( { name: "John D", party: :democrat } )
      @candidate6 = @race3.register_candidate!( { name: "Regina R", party: :republican } )
      @election.add_race(@race1)
      @election.add_race(@race2)
      @election.add_race(@race3)

      3.times { @candidate1.vote_for! }
      1.times { @candidate2.vote_for! }
      10.times { @candidate3.vote_for! }
      5.times { @candidate4.vote_for! }
      100.times { @candidate5.vote_for! }
      50.times { @candidate6.vote_for! }

      expected = {
        "Diana D" => 3, 
        "Roberto R" => 1,
        "Debbie D" => 10, 
        "Ryan R" => 5,
        "John D" => 100, 
        "Regina R" => 50
      }
    end
    it "says if there is a tie" do
      
    end
end