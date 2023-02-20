# == Schema Information
#
# Table name: events
#
#  id         :bigint           not null, primary key
#  date       :string
#  eventname  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_events_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Event < ApplicationRecord
    belongs_to(
    :user,
    class_name:  'User',
    foreign_key: 'user_id',
    inverse_of:  :events
  )

  has_many(
    :event_participations,
    class_name: 'EventParticipation',
    foreign_key: 'event_id',
    inverse_of: :event,
    dependent: :destroy
  )
  has_many :teams, through: :event_participations
end
