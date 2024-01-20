module Mutations
  module SurveyMutations

    class UpdateSurvey < BaseMutation
      argument :name, String, required: false
      argument :id, ID, required: true
        
      type Types::SurveyType


      def resolve(name: , id: )
        unless context && context[:current_user] && context[:current_user][0]["role"] == "adm"
          raise GraphQL::ExecutionError, "Permissão negada"
        end
        SurveyModule::SurveyUpdater.call(id, name)

      end
    end
  end
end