class Election
  attr_reader :year,
              :races,
              :candidates,
              :vote_counts
  def initialize(year)
    @year         = year
    @races        = []
    @candidates   = []
    @vote_counts  = Hash.new(0)
  end

  def add_race(race)
    @races << race
    new_race(race)
    count_votes(race)
  end

  def new_race(race)
    race.candidates.find_all do |candidate|
      @candidates << candidate
    end
  end

  def count_votes(race)
    race.candidates.each do |candidate|
      @vote_counts[candidate.name] += candidate.votes
    end
  end
end