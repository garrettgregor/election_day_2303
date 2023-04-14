require "spec_helper"

RSpec.describe Election do
  before(:each) do 
    @election2023 = Election.new("2023")
  end
  
  describe "initialize" do
    it "exists and has attributes" do
      expect(@election2023.class).to eq(Election)
      expect(@election2023.year).to eq("2023")
    end
  end
end