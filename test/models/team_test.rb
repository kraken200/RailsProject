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
require "test_helper"

class TeamTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
