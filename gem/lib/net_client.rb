require 'net/http'
require 'json'

module GetFiveStars
    module Api
        class NetClient        
            def initialize(request)
                @request = request
            end
            
            def send_request
                req = Net::HTTP::Post.new("/api" + @request.get_action, initheader = {'Content-Type' =>'application/json'})
                req.body = @request.get_parameters.to_json
                http = Net::HTTP.new("getfivestars.com", 443)
                http.use_ssl = true
                response = http.start {|http| http.request(req) }
                GetFiveStars::Api::Response.new(JSON.parse(response.body))
            end
        end
    end
end