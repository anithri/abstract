# == Schema Information
#
# Table name: games
#
#  id         :bigint(8)        not null, primary key
#  phase      :integer          default(0)
#  round      :integer          default(0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Game < ApplicationRecord
  has_many :decks
  has_many :turn_orders
  has_many :players, through: :turn_orders
end
