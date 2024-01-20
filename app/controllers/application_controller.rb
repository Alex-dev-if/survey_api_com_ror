class ApplicationController < ActionController::Base

    def encode_token (role, id)
        payload = { role: role, id: id }
        JWT.encode payload, 'secret', 'HS256'
        #role => [adm ou user]

    end

    def decode_token
        auth_header = request.headers['Authorization']
        if auth_header 
            token = auth_header.split(' ').last
            begin 
                JWT.decode token, 'secret', true, {algorithm: 'HS256'}
            rescue JWT::DecodeError
                nil
            end 
        end
    end



    
    def authorized_user
        decoded_token = decode_token
        if decoded_token
            user_id = decoded_token[0]['user_id']
            @user = User.find_by(id: user_id)
        end
    end

    def authorize
        render json: {message: 'Usuário não logado'}, status: :unauthorized unless authorized_user
    end
    def current_user
        decode_token
    end
end
