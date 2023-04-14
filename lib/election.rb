class Election
  attr_reader :year,
              :races,
              :vote_counts
  def initialize(year)
    @year         = year
    @races        = []
    @vote_counts  = {}
  end
  
  def add_race(race)
    @races << race
    @races
  end
  
  def candidates
    all_candidates = []
    @races.each do |race|
      race.candidates.each do |candidate|
        all_candidates << candidate
      end
    end
    all_candidates
  end


  # def new_race(race)
  #   race.candidates.find_all do |candidate|
  #     @candidates << candidate
  #   end
  # end

  # def count_votes(race)
  #   race.candidates.each do |candidate|
  #     @vote_counts[candidate.name] += candidate.votes
  #   end
  # end
end