class ChangeIsSelfToVoterId < ActiveRecord::Migration[6.0]
  def change
    remove_column :votes, :is_self
    add_column :votes, :voter_id, :integer
  end
end
