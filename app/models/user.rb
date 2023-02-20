# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  bio                    :string
#  dob                    :date
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  interests              :string
#  location               :string
#  name                   :string
#  position               :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  team_id                :bigint
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_team_id               (team_id)
#
# Foreign Keys
#
#  fk_rails_...  (team_id => teams.id)
#
class User < ApplicationRecord

  belongs_to(
    :team,
    class_name:  'Team',
    foreign_key: 'team_id',
    inverse_of:  :users
  )

  has_many(
    :events,
    class_name:  'Event',
    foreign_key: 'user_id',
    inverse_of:  :user
  )

  has_many(
    :group_participations,
    class_name: 'GroupParticipation',
    foreign_key: 'user_id',
    inverse_of: :user,
    dependent: :destroy
  )
  has_one_attached :user_image
  has_many :groups, through: :group_participations
  has_many :admins, ->{ where(group_participations: { admin: true }) }, :through => :group_participations, :class_name => 'Group', :source => :group

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
