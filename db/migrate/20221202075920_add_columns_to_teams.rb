class AddColumnsToTeams < ActiveRecord::Migration[7.0]
  def change
    add_column :teams, :uid, :integer
    add_column :teams, :full, :string
  end
end
