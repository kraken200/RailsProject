# == Schema Information
#
# Table name: venues
#
#  id         :bigint           not null, primary key
#  capacity   :integer
#  city       :string
#  picture    :string
#  stadium    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Venue < ApplicationRecord
end
