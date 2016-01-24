module Selectable
  def up_voted
    self.votes.select { |vote| vote.vote_type == 1}.length
  end

  def down_voted
    self.votes.select{ |vote| vote.vote_type == -1}.length
  end
end