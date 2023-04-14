class Election
  attr_reader :year,
              :races,
              :candidates,
              :vote_counts
  def initialize(year)
    @year         = year
    @races        = []
    @candidates   = []
    @vote_counts  = {}
  end

  def add_race(race)
    race.candidates.find_all do |candidate|
      @candidates << candidate
    end
    @races << race
  end
end