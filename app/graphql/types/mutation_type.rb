Types::MutationType = GraphQL::ObjectType.define do
  name "Mutation"

  field :shufflePlayerOrder, Mutations::ShufflePlayerOrder.field
  field :finishPlayerTurn, Mutations::FinishPlayerTurn.field
end
