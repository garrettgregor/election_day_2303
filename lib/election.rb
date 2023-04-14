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
    @candidates << race.candidate
    @races << race
  end
end