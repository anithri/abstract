Types::BagCountType = GraphQL::ObjectType.define do
  name "BagCount"
  description "Number of workers in each bag"
  field :bar, types.Int
  field :draw, types.Int
  field :discard, types.Int
  field :reserve, types.Int
  field :projects, types.Int
  field :dead, types.Int
end
