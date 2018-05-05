class Deck < ApplicationRecord
  belongs_to :game
  belongs_to_active_hash :card
  belongs_to_active_hash :board
end
