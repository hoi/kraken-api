class CreateTeamActions < ActiveRecord::Migration[6.0]
  def change
    create_table :team_actions do |t|
      t.references :team, null: false, foreign_key: true
      t.string :action

      t.timestamps
    end
  end
end
