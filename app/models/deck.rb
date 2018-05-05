# == Schema Information
#
# Table name: decks
#
#  id         :bigint(8)        not null, primary key
#  card_ids   :integer          default([]), is an Array
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  board_id   :integer
#  game_id    :bigint(8)
#
# Indexes
#
#  index_decks_on_game_id  (game_id)
#
# Foreign Keys
#
#  fk_rails_...  (game_id => games.id)
#

class Deck < ApplicationRecord
  belongs_to :game
  belongs_to_active_hash :board
  default_scope ->{order(order: :asc)}

  def cards
    card_ids.map{|c_id| Card.find(c_id)}
  end
end
