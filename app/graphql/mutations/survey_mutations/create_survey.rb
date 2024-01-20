module Mutations
  module SurveyMutations
    class CreateSurvey < BaseMutation

      argument :name, String, required: true
      argument :user_id, ID, required: true
              
      type Types::SurveyType

      def resolve(name: , user_id: )
        unless context && context[:current_user] && context[:current_user][0]["role"] == "adm"
          raise GraphQL::ExecutionError, "Permissão negada"
        end        
        SurveyModule::SurveyCreator.call(user_id, name)

      end
    end
  end
end
