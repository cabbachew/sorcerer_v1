class AddTeamReferenceToSources < ActiveRecord::Migration[7.0]
  def change
    add_reference :sources, :team, null: false, foreign_key: true
  end
end
