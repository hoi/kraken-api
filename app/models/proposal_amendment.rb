class ProposalAmendment < ApplicationRecord
  belongs_to :proposal
  belongs_to :user
end
