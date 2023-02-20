class AddColumnsToGroups < ActiveRecord::Migration[7.0]
  def change
    add_column :groups, :location, :string
    add_column :groups, :interests, :string

  end
end
