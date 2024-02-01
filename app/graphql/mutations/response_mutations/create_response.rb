module Mutations
	module ResponseMutations
		class CreateResponse < BaseMutation
		
		argument :content, GraphQL::Types::JSON, required: true
		argument :question_id, ID, required: true
					
		type Types::ResponseType

			def resolve(content:, question_id:)
				authorize! :create, Response     
				ResponseModule::ResponseCreator.call(content, question_id)

			end
		end
	end
end
