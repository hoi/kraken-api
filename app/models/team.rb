class Team < ApplicationRecord
  has_many :team_actions, dependent: :destroy
end
