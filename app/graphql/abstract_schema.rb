AbstractSchema = GraphQL::Schema.define do
  # Create UUIDs by joining the type name & ID, then base64-encoding it
  id_from_object lambda { |object, type_definition, _query_ctx|
    GraphQL::Schema::UniqueWithinType.encode(type_definition.name, object.id)
  }

  object_from_id lambda { |id, _query_ctx|
    class_name, item_id = GraphQL::Schema::UniqueWithinType.decode(id)

    Object.const_get(class_name).find(item_id)
  }

  mutation(Types::MutationType)
  query(Types::QueryType)
end
