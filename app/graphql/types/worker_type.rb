Types::WorkerType = GraphQL::ObjectType.define do
  name "Worker"
  description 'Worker Info'

  field :id, !types.ID
  field :name, types.String
  field :theme, types.String

end
