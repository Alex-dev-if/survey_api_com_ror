module Types
  class QueryType < Types::BaseObject

    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :surveys, 
    [Types::SurveyType], 
    null: false, 
    description: "Retorne uma listas de surveys."
  
    def surveys
      if context[:current_user].nil? #Nega a pergmissão caso o curret_user seja nil, provavelmente o token não foi passado corretamente
        raise GraphQL::ExecutionError, "Permissão negada"
      end

      Survey.all
    end

    field :questions, 
    [Types::QuestionType], 
    null: false, 
    description: "Retorne uma listas de questions."
  
    def questions
      if context[:current_user].nil?
        raise GraphQL::ExecutionError, "Permissão negada"
      end

      Question.all
    end

    field :responses, 
    [Types::ResponseType], 
    null: false, 
    description: "Retorne uma listas de responses." do 
      argument :survey_id, ID, required: true 
    end
  
    def responses(survey_id: )
      if context[:current_user].nil?
        raise GraphQL::ExecutionError, "Permissão negada"
      end
      responses = ResponseModule::ResponseReader.call(survey_id)
      responses
    end
  end
end
