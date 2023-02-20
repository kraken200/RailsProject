class CreateEventParticipations < ActiveRecord::Migration[7.0]
  def change
    create_table :event_participations do |t|
      t.references :team, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
