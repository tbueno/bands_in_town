require "rubygems"
require "httparty"
module  BandsInTown
  
  ROOT_URL = "http://api.bandsintown.com/"
  FORMAT = ".json"
  APP_ID = "my_apllication_id"
  
  require 'bands_in_town/artists'
  require 'bands_in_town/events'
  require 'bands_in_town/h_t_t_p'
    
end