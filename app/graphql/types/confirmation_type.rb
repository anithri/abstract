Types::ConfirmationType = GraphQL::ObjectType.define do
  name 'Confirmation'
  description 'confirm an operation'

  field :confirm, types.Boolean
end
