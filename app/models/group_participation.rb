# == Schema Information
#
# Table name: group_participations
#
#  id         :bigint           not null, primary key
#  admin      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  group_id   :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_group_participations_on_group_id  (group_id)
#  index_group_participations_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (group_id => groups.id)
#  fk_rails_...  (user_id => users.id)
#
class GroupParticipation < ApplicationRecord
  belongs_to :user
  belongs_to :group
  validates :admin, inclusion: {
in: ["true", "false"]
  }
end
