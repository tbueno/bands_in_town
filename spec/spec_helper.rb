require "#{File.dirname(__FILE__)}/../lib/bands_in_town"
require "rubygems"
require "fakeweb"
require "stub_helper"

ROOT_URL = "http://api.bandsintown.com"
ARTIST_SEARCH_URL = ROOT_URL+"/artists"

include StubHelper

FakeWeb.allow_net_connect = false # Avoid real calls by mistake

FakeWeb.register_uri(:get, "#{ARTIST_SEARCH_URL}/wilco.json?app_id=my_apllication_id", :body => artist_search_response)

FakeWeb.register_uri(:get, "#{ARTIST_SEARCH_URL}/unknown_artist.json?app_id=my_apllication_id", :status => ["404", "Not Found"])

FakeWeb.register_uri(:get, "#{ARTIST_SEARCH_URL}/Guided%20By%20Voices.json?app_id=my_apllication_id", :body => artist_two_name_search_response)  
  
  
  