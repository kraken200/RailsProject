# == Schema Information
#
# Table name: teams
#
#  id          :bigint           not null, primary key
#  coach       :string
#  description :string
#  full        :string
#  name        :string
#  string      :string
#  uid         :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Team < ApplicationRecord
  has_many(
    :users,
    class_name:  'User',
    foreign_key: 'team_id',
    inverse_of:  :team,
  )

  has_many(
    :event_participations,
    class_name: 'EventParticipation',
    foreign_key: 'team_id',
    inverse_of: :team,
    dependent: :destroy
  )
  has_many :events, through: :event_participations
    def change
        create_table :team do |t|
          t.string :name
          t.string :description
          t.string :coach
          t.timestamps
        end
    end
  validates :full, inclusion: {
  in: ["full", "not full"]
    }
end
