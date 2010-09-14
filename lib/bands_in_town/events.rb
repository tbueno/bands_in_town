module BandsInTown
  module Events
    RELATIVE_URL = 'events/'
    
    require "events/event"
    require "events/venue"
    
    def self.search(args = {})
      response = HTTP.call(search_method+parse_params(args))
      events = []
      response.each do |r|
       
        artists = parse_artists(r)
        venue = parse_venue(r)
        events << Event.new(
                    r['id'], 
                    r['url'],
                    r['datetime'],
                    r['ticket_url'],
                    artists,
                    venue,
                    r['status'],
                    r['ticket_status'],
                    r['on_sale_datetime']
                    )
      end
      events
    end
    
    private
    
    def self.parse_venue(response)
      v  = response['venue']
      venue = Venue.new(v['venue_id'], v['url'], v['region'], v['city'], v['name'], v['country'],
                        v['latitude'], v['longitude'])
    end
    
    def self.parse_artists(response)
      artists = []
      
      response['artists'].each do |artist|
        name = artist['name']
        url = artist['url']
        upcoming_events_count = artist['upcoming_events_count']
        mbid = artist['mbid']
        artists << Artists::Artist.new(name, url, upcoming_events_count, mbid)
      end
      artists
    end
    
    def self.search_method(params = "")
      ROOT_URL+RELATIVE_URL+"search"+FORMAT+"?"+params
    end
    
    def self.parse_params(params)
      parsed_params = ""
      parsed_params  << format(params[:artists])
      parsed_params << "&app_id=#{APP_ID}"
      parsed_params
    end
    
    # Name: artists[]
    # Format:
    #     artist name
    #     mbid_<id> (MusicBrainz ID)
    # Required?
    #     artists or location must be present
    # Notes:
    #     no more than 50 artists per request
    def self.format(artists)
      "artists[]=#{artists * '&artists[]='}"
    end
  end
end