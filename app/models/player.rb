# == Schema Information
#
# Table name: players
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  theme      :string
#  worker_ids :integer          default([]), is an Array
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  game_id    :bigint(8)
#
# Indexes
#
#  index_players_on_game_id  (game_id)
#
# Foreign Keys
#
#  fk_rails_...  (game_id => games.id)
#

class Player < ApplicationRecord
  belongs_to :game

  def board
    Board.find_by(name: theme, game: game)
  end

  def cards
    board.cards
  end

  def score
    0
  end

  def workers
    worker_ids.map{|w_id| Worker.find(w_id)}
  end
end
