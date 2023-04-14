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
end