Types::BoardType = GraphQL::ObjectType.define do
  name 'Board'
  description 'Place for cards on the Game Board'

  field :id, !types.ID
  field :name, types.String

  field :cards, types[Types::CardType]

end
