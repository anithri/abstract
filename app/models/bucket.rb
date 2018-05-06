require_relative './card'

class Bucket < ActiveHash::Base
  CARD_DATA = Card.all.map do |card|
    {
      id:          card.id,
      name:        card.name,
      default_bag: []
    }
  end

  WORKER_DATA = Worker.all.map(&:id)

  DEFAULT_COUNTS = {
    bar:     2,
    dead:    0,
    discard: 3,
    draw:    5,
    reserve: 20
  }

  DEFAULT_COUNTS.default_proc = ->(h, k) { h[k] = 0 }

  def self.mk_pool(type)
    WORKER_DATA.map do |worker_id|
      [worker_id] * DEFAULT_COUNTS[type]
    end.flatten
  end

  self.data = CARD_DATA + [
    {
      id:          1001,
      name:        'bar',
      default_bag: self.mk_pool(:bar)
    },
    {
      id:          1002,
      name:        'draw',
      default_bag: self.mk_pool(:draw)
    },
    {
      id:          1003,
      name:        'discard',
      default_bag: self.mk_pool(:discard)
    },
    {
      id:          1004,
      name:        'reserve',
      default_bag: self.mk_pool(:reserve)
    },
    {
      id:          1005,
      name:        'dead',
      default_bag: self.mk_pool(:dead)
    },
  ]
end
