class Proposal < ApplicationRecord
  belongs_to :user

  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy
end
