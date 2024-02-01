module Mutations
    module ResponseMutations
        class UpdateResponse < BaseMutation

            argument :content, GraphQL::Types::JSON, required: false, default_value: nil
            argument :id, ID, required: true
                        
            type Types::ResponseType

            def resolve(content:, id:)
                authorize! :update, Response     
                ResponseModule::ResponseUpdater.call(id, content)

            end
        end
    end
end
