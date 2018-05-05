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
  has_one :turn_order

  delegate :order, :current, to: :turn_order

  default_scope ->{includes(:turn_order).order('turn_orders.order')}

  def self.current
    TurnOrder.includes(:player).where(current: true).first.player
  end

  def board
    Board.find_by(name: theme)
  end

  def cards
    board.cards
  end
end
