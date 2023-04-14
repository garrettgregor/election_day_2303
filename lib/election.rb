class Election
  attr_reader :year,
              :races
  def initialize(year)
    @year         = year
    @races        = []
  end
  
  def add_race(race)
    @races << race # this automatically returns races, so no need to return @races
  end

  def candidates
    @races.flat_map do |race|
      race.candidates
    end
  end

  def vote_counts
    h = Hash.new(0)
    @races.each do |race|
      race.candidates.each do |candidate|
        h[candidate.name] += candidate.votes
      end
    end
    h
  end
end