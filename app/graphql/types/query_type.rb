module Types
  class QueryType < Types::BaseObject
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :surveys, 
    [Types::SurveyType], 
    null: false, 
    description: "Retorne uma listas de surveys"

    def surveys
      Survey.all
    end

    field :questions, 
    [Types::QuestionType], 
    null: false, 
    description: "Retorne uma listas de questions"
  
    def questions
      Question.all
    end

    field :responses, 
    [Types::ResponseType], 
    null: false, 
    description: "Retorne uma listas de responses" do 
      argument :survey_id, ID, required: true 
    end
  
    def responses(survey_id: )
      responses = ResponseModule::ResponseReader.call(survey_id)
      responses
    end
  end
end
