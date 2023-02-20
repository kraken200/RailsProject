# == Schema Information
#
# Table name: discussions
#
#  id         :bigint           not null, primary key
#  content    :string
#  uid        :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  group_id   :bigint
#
# Indexes
#
#  index_discussions_on_group_id  (group_id)
#
# Foreign Keys
#
#  fk_rails_...  (group_id => groups.id)
#
class Discussion < ApplicationRecord
    belongs_to(
        :group,
        class_name:  'Group',
        foreign_key: 'group_id',
        inverse_of:  :discussions
      )
      validates_presence_of :content, :message => "Message cannot be empty"
end
