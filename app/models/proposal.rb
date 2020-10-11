class Proposal < ApplicationRecord
  belongs_to :user

  has_many :proposal_amendments, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy
end
