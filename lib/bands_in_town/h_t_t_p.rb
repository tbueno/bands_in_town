module BandsInTown
  class HTTP
    include HTTParty
     format :json
    
    def self.call(method, params = {})
      get(method, :query => params)
    end
  end
end