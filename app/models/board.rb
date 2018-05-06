class Board < ActiveHash::Base

  self.data = [
    { id: 11, name: 'playerOne', player: true },
    { id: 12, name: 'playerTwo', player: true },
    { id: 13, name: 'playerThree', player: true },
    { id: 14, name: 'playerFour', player: true },
    { id: 20, name: 'Draw' },
    { id: 21, name: 'Discard' },
    { id: 101, name: 'project1', project: true },
    { id: 102, name: 'project2', project: true },
    { id: 103, name: 'project3', project: true },
    { id: 104, name: 'project4', project: true },
    { id: 105, name: 'project5', project: true },
    { id: 106, name: 'project6', project: true },
    { id: 107, name: 'project7', project: true },
    { id: 108, name: 'project8', project: true },
    { id: 109, name: 'project9', project: true },
    { id: 110, name: 'project10', project: true },
    { id: 111, name: 'project11', project: true },
    { id: 112, name: 'project12', project: true },
    { id: 113, name: 'project13', project: true },
    { id: 114, name: 'project14', project: true },
    { id: 115, name: 'project15', project: true },
    { id: 116, name: 'project16', project: true }
  ]

  def cards
    Deck.where(board_id: id).order(:card_id)
  end

  def self.projects
    self.where(project: true)
  end

  def self.players
    self.where(player: true)
  end
end
