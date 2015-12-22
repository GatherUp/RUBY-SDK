module GetFiveStars
    module Api
        class Request        
            def initialize(action, request)
                @action = action
                @request = request
            end
            
            def set(key, val)
                @request[key] = val
            end
            
            def get(key)
                if @request.include?(key)
                    @request[key]
                else
                    ""
                end
            end
            
            def get_parameters()
                @request
            end
            
            def get_action()
                @action
            end
        end
    end
end