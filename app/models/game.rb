# == Schema Information
#
# Table name: games
#
#  id         :bigint(8)        not null, primary key
#  bar_side   :string           default("top")
#  phase      :integer          default(0)
#  player_ids :integer          default([]), is an Array
#  round      :integer          default(0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Game < ApplicationRecord
  has_many :decks

  def players
    player_ids.map{|pid| Player.find(pid)}
  end

  def current_player
    Player.find(player_ids.first)
  end
end
