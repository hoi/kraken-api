class AddDescriptionAndThumbnailToTeams < ActiveRecord::Migration[6.0]
  def change
    add_column :teams, :description, :string
    add_column :teams, :thumbnail, :string
  end
end
