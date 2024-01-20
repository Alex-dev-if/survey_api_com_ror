module Types
  class ResponseType < Types::BaseObject
    field :id, ID, null: false
    field :content, GraphQL::Types::JSON
    field :question_id, Integer, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
