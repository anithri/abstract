# == Schema Information
#
# Table name: turn_orders
#
#  id         :bigint(8)        not null, primary key
#  current    :boolean
#  order      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  game_id    :bigint(8)
#  player_id  :bigint(8)
#
# Indexes
#
#  index_turn_orders_on_game_id    (game_id)
#  index_turn_orders_on_player_id  (player_id)
#
# Foreign Keys
#
#  fk_rails_...  (game_id => games.id)
#  fk_rails_...  (player_id => players.id)
#

class TurnOrder < ApplicationRecord
  belongs_to :game
  belongs_to :player

  def self.shuffle
    players = TurnOrder.pluck(:player_id).shuffle
    TurnOrder.destroy_all
    game = Game.first
    players.each_with_index.map do |player, idx|
      TurnOrder.create(
        game: game,
        order: idx + 1,
        player_id: player,
        current: idx == 0
      )
    end
  end
end
