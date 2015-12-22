require 'digest'

module GetFiveStars
    module Api
        class AuthToken        
            def initialize(client_id, private_key)
                @client_id = client_id
                @private_key = private_key
            end
            
            def sign_request(request)
                request.set('clientId', @client_id)
                token = ""
                request.get_parameters.sort.map do |key,value|
                    token += key + value
                end
                request.set('hash', Digest::SHA256.hexdigest(@private_key + token))
            end
        end
    end
end
