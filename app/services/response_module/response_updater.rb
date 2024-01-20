module ResponseModule
    class ResponseUpdater < ApplicationService
        def initialize(id, content)
            @id = id
            @content = content
            @params = {content: @content}

        end
    
        def call
            update_response
        end
        
        private 

        def update_response
            @params.reject! {|key, value| value.nil?}

            response = Response.find(@id)
            response.update!(@params)
            response
        end
    end
end
    