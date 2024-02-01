module Mutations
  module SurveyMutations
    class DeleteSurvey < BaseMutation

      argument :id, ID, required: true
        
      type Types::SurveyType

      def resolve(id: )
        authorize! :delete, Survey     
        SurveyModule::SurveyDestroyer.call(id)

      end
    end
  end
end