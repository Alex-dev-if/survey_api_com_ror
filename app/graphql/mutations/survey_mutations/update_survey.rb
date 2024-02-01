module Mutations
  module SurveyMutations
    class UpdateSurvey < BaseMutation
      argument :name, String, required: false, default_value: nil
      argument :id, ID, required: true
      argument :open, Boolean, required: false, default_value: nil

      type Types::SurveyType


      def resolve(name: , id:, open:)
        authorize! :update, Survey     
        SurveyModule::SurveyUpdater.call(id, name, open)

      end
    end
  end
end