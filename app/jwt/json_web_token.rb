module JsonWebToken
class Jwt 

    def encode_token (role, id)
        payload = { role: role, id: id }
        JWT.encode payload, key, 'HS256'
        #role => [adm ou user]

    end

    def decode_token(request)

        auth_header = request.headers['Authorization'] 
        if auth_header 
            token = auth_header.split(' ').last
            begin JWT.decode token, key, true, {algorithm: 'HS256'}
            rescue JWT::DecodeError 
                nil
            end 
        end
    end
    
    def authorized_user(request)
        decoded_token = decode_token(request)
        if decoded_token
            user_id = decoded_token[0]['id']
            @user = User.find_by(id: user_id)
        end
    end

    private 

    def key
        ENV['JWT_SECRET']
    end

end
end