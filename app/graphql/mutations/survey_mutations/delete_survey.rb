module Mutations
  module SurveyMutations
    class DeleteSurvey < BaseMutation

      argument :id, ID, required: true
        
      type Types::SurveyType

      def resolve(id: )
        unless context && context[:current_user] && context[:current_user][0]["role"] == "adm"
          raise GraphQL::ExecutionError, "Permissão negada"
        end
        SurveyModule::SurveyDestroyer.call(id)

      end
    end
  end
end