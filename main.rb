require 'getfivestars_api'

private_key = "ea480aeb30a44e7ba85448619f9a6a94775b35d5886d4ce52dd452efb414406e"
parameters = {}
parameters ["clientId"] = "80338307b78b8d84c8b4d40e63e235cc312fcebe"
parameters ["country"] = "United States"
parameters ["customField"] = "1234"
parameters ["organisationType"] = "company"
parameters ["businessOwnerFirstName"] = "John"
parameters ["businessType"] = "LocalBusiness"
parameters ["city"] = "Haiku"
parameters ["streetAddress"] = "4150 Hana Hwy"
parameters ["phone"] = "808-333-3334"
parameters ["state"] = "HI"
parameters ["businessName"] = "Peach Trees Intl."
parameters ["businessOwnerAccount"] = "1"
parameters ["businessOwnerEmail"] = "john.smith@abc-company.com"
parameters ["businessOwnerLastName"] = "Smith"
parameters ["websiteUrl"] = "https://www.peachtreeintl.abc-company.com"
parameters ["zip"] = "96708"

request = GetFiveStars::Api::Request.new("/business/create",parameters)
auth_token = GetFiveStars::Api::AuthToken.new("1224124", "21421424")
auth_token.sign_request(request)
client = GetFiveStars::Api::NetClient.new(request)
response = client.send_request

if response.get_status
    puts response.get_response
else
    puts response.get_error_code.to_s + " " + response.get_error_message
end