module ResponseModule
    class ResponseUpdater < ApplicationService
        def initialize(id, content)
            @id = id
            @content = content
        end
    
        def call
            update_response
        end
        
        private 
        
        def update_response
            response = Response.find(@id)
            response.update!(content: @content)
            response
        end
    end
end
    