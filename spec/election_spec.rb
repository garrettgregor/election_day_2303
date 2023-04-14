require "spec_helper"

RSpec.describe Election do
  # before(:each) do 
  #   @election = Election.new("2023")
  #   @race = Race.new("Texas Governor")
  #   @candidate1 = @race.register_candidate!({name: "Diana D", party: :democrat})
  #   @candidate2 = @race.register_candidate!({name: "Roberto R", party: :republican})
  # end
  
  describe "initialize" do
    it "exists and has attributes" do
      election = Election.new("2023")
      race1 = Race.new("Texas Governor")
      candidate1 = race1.register_candidate!({ name: "Diana D", party: :democrat })
      candidate2 = race1.register_candidate!({ name: "Roberto R", party: :republican })
      expect(election.class).to eq(Election)
      expect(election.year).to eq("2023")
      expect(election.races).to eq([])
    end
  end
  
  describe "#add_race" do
    it "adds races to the election" do
      election = Election.new("2023")
      race1 = Race.new("Texas Governor")
      candidate1 = race1.register_candidate!({ name: "Diana D", party: :democrat })
      candidate2 = race1.register_candidate!({ name: "Roberto R", party: :republican })
      election.add_race(race1)

      expect(election.races).to eq([race1])
    end
  end

  describe "#candidates" do
    it "can return a list of candidates in each election" do
      election = Election.new("2023")
      race1 = Race.new("Texas Governor")
      candidate1 = race1.register_candidate!({ name: "Diana D", party: :democrat })
      candidate2 = race1.register_candidate!({ name: "Roberto R", party: :republican })
      race2 = Race.new("Texas Governor")
      candidate3 = race2.register_candidate!({ name: "Debbie D", party: :democrat })
      candidate4 = race2.register_candidate!({ name: "Ryan R", party: :republican })

      expect(election.candidates).to eq([])
      
      election.add_race(race1)

      expect(election.candidates).to eq([candidate1, candidate2])
      
      election.add_race(race2)
      
      expect(election.candidates).to eq([candidate1, candidate2, candidate3, candidate4])
    end
  end
end
  
describe "#vote_count" do
  it "can return a total count of votes for each candidate" do
    election = Election.new("2023")
    race1 = Race.new("Texas Governor")
    candidate1 = race1.register_candidate!( { name: "Diana D", party: :democrat } )
    candidate2 = race1.register_candidate!( { name: "Roberto R", party: :republican } )
    race2 = Race.new("Texas Governor")
    candidate3 = race2.register_candidate!( { name: "Debbie D", party: :democrat } )
    candidate4 = race2.register_candidate!( { name: "Ryan R", party: :republican } )
    election.add_race(race1)
    election.add_race(race2)

    3.times { candidate1.vote_for! }
    1.times { candidate2.vote_for! }
    10.times { candidate3.vote_for! }
    5.times { candidate4.vote_for! }

    expected = {
      "Diana D" => 3, 
      "Roberto R" => 1,
      "Debbie D" => 10, 
      "Ryan R" => 5
    }
    
    expect(election.vote_counts).to eq(expected)
  end
end