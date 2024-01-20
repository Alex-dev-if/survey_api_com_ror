module Mutations
module QuestionMutations
class CreateQuestion < BaseMutation

      argument :text, String, required: true
      argument :survey_id, ID, required: true
      argument :question_type, String, required: true
      argument :required, Boolean, required: true
      argument :options, [String], required: false
            
      type Types::QuestionType

      def resolve(text: , question_type:, required:, options:, survey_id: )
      unless context && context[:current_user] && context[:current_user][0]["role"] == "adm" #Gera um erro a não ser que o token tenha a role permitida.
        raise GraphQL::ExecutionError, "Permissão negada"
      end
        QuestionModule::QuestionCreator.call(text, question_type, required, options, survey_id) 

      end
    end
  end
end