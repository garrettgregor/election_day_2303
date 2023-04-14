class Election
  attr_reader :year,
              :races
  def initialize(year)
    @year         = year
    @races        = []
  end
  
  def add_race(race)
    @races << race
    @races
  end

  def candidates
    arr = []
    @races.each do |race|
      race.candidates.each do |candidate|
        arr << candidate
      end
    end
    arr
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