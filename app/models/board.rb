class Board < ActiveHash::Base

  self.data = [
    { id: 11, name: 'playerOne' },
    { id: 12, name: 'playerTwo' },
    { id: 13, name: 'playerThree' },
    { id: 14, name: 'playerFour' },
    { id: 20, name: 'Draw' },
    { id: 21, name: 'Discard' },
    { id: 22, name: 'Common'},
    { :id => 101, :name => 'active1' },
    { :id => 102, :name => 'active2' },
    { :id => 103, :name => 'active3' },
    { :id => 104, :name => 'active4' },
    { :id => 105, :name => 'active5' },
    { :id => 106, :name => 'active6' },
    { :id => 107, :name => 'active7' },
    { :id => 108, :name => 'active8' },
    { :id => 109, :name => 'active9' },
    { :id => 110, :name => 'active10' },
    { :id => 111, :name => 'active11' },
    { :id => 112, :name => 'active12' },
    { :id => 113, :name => 'active13' },
    { :id => 114, :name => 'active14' },
    { :id => 115, :name => 'active15' },
    { :id => 116, :name => 'active16' }
  ]

  def cards
    Deck.where(board_id: id).order(:card_id)
  end
end
