class AddVoteTypeToProposals < ActiveRecord::Migration[6.0]
  def change
    add_column :vote_type, :proposals, :string
  end
end
