
module Types
  class QuestionType < Types::BaseObject
    field :id, ID, null: false
    field :text, String, null: false
    field :survey_id, Integer, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :question_type, String, null: false
    field :required, Boolean, null: false
    field :options, String
  end
end
