# == Schema Information
#
# Table name: players
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  theme      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Player < ApplicationRecord
end
