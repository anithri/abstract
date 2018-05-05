all = [
  ['Bruce', 'playerOne'],
  ['Barbara', 'playerTwo'],
  ['Dick', 'playerThree'],
  ['Selina', 'playerFour']
]

all.each do |(name, theme)|
  Player.find_or_create_by(name: name, theme: theme)
end
