# == Schema Information
#
# Table name: bags
#
#  id         :bigint(8)        not null, primary key
#  worker_ids :integer          default([]), is an Array
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  bucket_id  :integer
#  game_id    :bigint(8)
#
# Indexes
#
#  index_bags_on_game_id  (game_id)
#
# Foreign Keys
#
#  fk_rails_...  (game_id => games.id)
#

class Bag < ApplicationRecord
  belongs_to :game

  scope :cards, -> { where('bucket_id < 1000') }
  scope :board, -> { where('bucket_id >= 1000') }

  def workers
    worker_ids.map { |w_id| Worker.find(w_id) }
  end

  def bucket
    Bucket.find(bucket_id)
  end

  def name
    bucket.name
  end

  def count
    workers.length
  end

  def self.card_workers
    self.cards.pluck(:worker_ids).flatten
  end

  def self.by_name(name)
    bucket = Bucket.find_by_name(name)
    Bag.find_by(bucket_id: bucket.id)
  end
end
