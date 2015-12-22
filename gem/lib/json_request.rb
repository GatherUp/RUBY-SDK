require 'json'

module GetFiveStars
    module Api
        class JsonRequest < GetFiveStars::Api::Request        
            def initialize(action, json)
                super(action, JSON.parse(json))
            end
        end
    end
end