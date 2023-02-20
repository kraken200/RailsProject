class CreateTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :description
      t.string :coach
      t.string :string

      t.timestamps
    end
  end
end
