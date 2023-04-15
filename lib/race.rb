class Race
  attr_reader :office,
              :candidates,
              :open
  def initialize(office)
    @office     = office
    @candidates = []
    @open       = true
  end

  def register_candidate!(candidate_details)
    new_candidate = Candidate.new(candidate_details)
    @candidates << new_candidate
    new_candidate
  end

  def open?
    @open
  end

  def close!
    @open = false
  end

  def winner
    return false if open?
    # @candidates.max_by(&:votes) # same as...
    @candidates.max_by do |candidate|
      candidate.votes
    end
  end

  def tie?
    top_two = @candidates.map(&:votes).max(2)
    top_two.first == top_two.last
  end

  def winners
    @races.filter_map do |race|
      race.winner unless race.tie?
    end
  end
end