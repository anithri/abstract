Mutations::ShufflePlayerOrder = GraphQL::Relay::Mutation.define do
  name 'ShufflePlayerOrder'

  return_field :players, types[Types::PlayerType]

  input_field :confirm, !types.Boolean

  resolve ->(obj, args, ctx) {
  }
end
