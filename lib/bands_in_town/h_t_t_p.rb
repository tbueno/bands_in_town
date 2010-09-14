module BandsInTown
  class HTTP
    include HTTParty
     format :json
    
    def self.call(method, args = {})
      get(method, args)
    end
  end
end