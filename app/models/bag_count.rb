class BagCount
  def initialize
    @bags = Bag.board.group_by(&:name).transform_values(&:first)
  end

  def bar
    @bags['bar'].count
  end

  def draw
    @bags['draw'].count
  end

  def discard
    @bags['discard'].count
  end

  def reserve
    @bags['reserve'].count
  end

  def projects
    Bag.card_workers.count
  end

  def dead
    @bags['dead'].count
  end

  def self.all
    self.new
  end
end
