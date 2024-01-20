module Mutations
  module QuestionMutations
    class UpdateQuestion < BaseMutation

      argument :text, String, required: false, default_value: nil
      argument :id, ID, required: true
      argument :question_type, String, required: false, default_value: nil
      argument :required, Boolean, required: false, default_value: nil
      argument :options, [String], required: false, default_value: nil
              
      type Types::QuestionType

      def resolve(text: , question_type:, required:, options:, id: )
        unless context && context[:current_user] && context[:current_user][0]["role"] == "adm"
          raise GraphQL::ExecutionError, "Permissão negada"
        end
        QuestionModule::QuestionUpdater.call(text, question_type, required, options, id)

      end
    end
  end
end