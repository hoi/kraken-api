class CreateProposalAmendments < ActiveRecord::Migration[6.0]
  def change
    create_table :proposal_amendments do |t|
      t.references :proposal, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :text
      t.string :status

      t.timestamps
    end
  end
end
