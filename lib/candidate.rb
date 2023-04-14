class Candidate
  attr_reader :candidate_details
  def initialize(candidate_details)
    @candidate_details = {
      name:   candidate_details[:name],
      party:  candidate_details[:party]
    }
  end
end