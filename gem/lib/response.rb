module GetFiveStars
    module Api
        class Response        
            def initialize(response)
                if(not response.include?("errorCode") or not response.include?("errorMessage"))
                    response["errorCode"] = "-1"
                    response["errorMessage"] = "Unknown error"
                end
                
                @error_code = response["errorCode"]
                @error_message = response["errorMessage"]
                
                response.delete("errorCode")
                response.delete("errorMessage")
                
                @response = response
            end
            
            def get_status
                self.get_error_code == 0
            end
            
            def get_error_code
                @error_code
            end
            
            def get_error_message
                @error_message
            end
            
            def get_response
                @response
            end
        end
    end
end 
