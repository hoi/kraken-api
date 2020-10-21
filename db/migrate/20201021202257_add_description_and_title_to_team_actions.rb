class AddDescriptionAndTitleToTeamActions < ActiveRecord::Migration[6.0]
  def change
    add_column :team_actions, :title, :string
    add_column :team_actions, :description, :string
  end
end
