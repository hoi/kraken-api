class AddStatusToTeamUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :team_users, :status, :string
  end
end
