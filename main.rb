require 'getfivestars_api'

request = GetFiveStars::Api::JsonRequest.new("/business/create", '{"param1":"value1","param2":5}')
auth_token = GetFiveStars::Api::AuthToken.new("80338307b78b8d84c8b4d40e63e235cc312fcebe", "ea480aeb30a44e7ba85448619f9a6a94775b35d5886d4ce52dd452efb414406e")
auth_token.sign_request(request)
client = GetFiveStars::Api::NetClient.new(request)
response = client.send_request

if response.get_status
    puts response.get_response
else
    puts response.get_error_code.to_s + " " + response.get_error_message
end