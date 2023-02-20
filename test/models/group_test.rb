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
require "test_helper"

class GroupTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
