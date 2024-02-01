module Mutations
  module QuestionMutations
    class CreateQuestion < BaseMutation

      argument :text, String, required: true
      argument :survey_id, ID, required: true
      argument :question_type, String, required: true
      argument :required, Boolean, required: true
      argument :options, [String], required: false, default_value: nil
            
      type Types::QuestionType

      def resolve(text: , question_type:, required:, options:, survey_id: )
        authorize! :create, Question     
        QuestionModule::QuestionCreator.call(text, question_type, required, options, survey_id) 

      end
    end
  end
end