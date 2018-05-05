Mutations::ShufflePlayerOrder = GraphQL::Relay::Mutation.define do
  name "ShufflePlayerOrder"
  argument :confirm, Types::ConfirmationType, required: true
  return_field :players, types[Types::PlayerType]

  resolve ->(obj, args, ctx) {
    TurnOrder.shuffle if confirm
  }
end
