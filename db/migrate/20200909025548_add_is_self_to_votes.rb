class AddIsSelfToVotes < ActiveRecord::Migration[6.0]
  def change
    add_column :votes, :is_self, :boolean
  end
end
