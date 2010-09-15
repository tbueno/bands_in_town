$:.unshift File.dirname(__FILE__)

require "rubygems"
require "URI"

module BandsInTown
  module Artists
    require "artists/artist"
    require "artists/event"

    
    RELATIVE_URL = 'artists/'
    
    def self.get(artist = nil)
      raise "Impossible to execute Artists.get method without artist name" unless artist
      response = HTTP.call(get_method(URI.escape(artist)), :query => {:app_id => APP_ID })
      url = response['url']
      upcoming_events_count = response['upcoming_events_count']
      mbid = response['mbid']
      Artist.new(artist, url, mbid, upcoming_events_count)
    end
    
    def self.events(artist = nil)
      raise "Impossible to execute Artists.events method without artist name" unless artist
        response = HTTP.call(events_method(URI.escape(artist)), :query => {:app_id => APP_ID })
        events = []
        response.each do |item|
          ev = BandsInTown::Artists::Event.new
          ev.url = item['url']
          ev.id = item['id']
          ev.ticket_status = item['ticket_status']
          ev.ticket_url = item['ticket_url']
          ev.on_sale_datetime = item['on_sale_datetime']
          ev.date_time = item['datetime']
          events << ev
        end
        events
      end
    
    private 

    def self.get_method(artist); ROOT_URL+RELATIVE_URL+artist+FORMAT; end
    def self.events_method(artist); ROOT_URL+RELATIVE_URL+artist+"/events"+FORMAT; end
   
  end
end