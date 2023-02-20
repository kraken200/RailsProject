# == Schema Information
#
# Table name: event_participations
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  event_id   :bigint           not null
#  team_id    :bigint           not null
#
# Indexes
#
#  index_event_participations_on_event_id  (event_id)
#  index_event_participations_on_team_id   (team_id)
#
# Foreign Keys
#
#  fk_rails_...  (event_id => events.id)
#  fk_rails_...  (team_id => teams.id)
#
require "test_helper"

class EventParticipationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
