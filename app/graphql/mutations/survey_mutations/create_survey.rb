module Mutations
  module SurveyMutations
    class CreateSurvey < BaseMutation

      argument :name, String, required: true
      argument :user_id, ID, required: true
      argument :open, Boolean, required: true

      type Types::SurveyType

      def resolve(name: , user_id:, open:)
        authorize! :create, Survey     
        SurveyModule::SurveyCreator.call(user_id, name, open)

      end
    end
  end
end
