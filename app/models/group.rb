# == Schema Information
#
# Table name: groups
#
#  id          :bigint           not null, primary key
#  description :string
#  interests   :string
#  location    :string
#  member_type :string
#  name        :string
#  star_player :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Group < ApplicationRecord
    has_many(
    :group_participations,
    class_name: 'GroupParticipation',
    foreign_key: 'group_id',
    inverse_of: :group,
    dependent: :destroy
  )

  has_many(
    :discussions,
    class_name:  'Discussion',
    foreign_key: 'group_id',
    inverse_of:  :group,
    dependent:   :destroy
  )

  has_one_attached :group_image
  has_many :users, through: :group_participations
  has_many :admins, ->{ where(group_participations: { admin: true }) }, :through => :group_participations, :class_name => 'User', :source => :user
  validates :name, presence: true

end
