require 'rubygems'
require 'open-uri'
require 'json' 

module BandsInTown
  class Artist
    RELATIVE_URL = 'artists/'
    attr_reader :name
    
    def initialize(name)
      @name = name
    end
    
    def get_method
      ROOT_URL+RELATIVE_URL+@name+FORMAT
    end
    
    def events_method
      ROOT_URL+RELATIVE_URL+@name+"/events"+FORMAT
    end
    
    def url
      get unless @url
      @url
    end
    
    def upcoming_events_count
      get unless @upcoming_events_count
      @upcoming_events_count
    end
    
    def mbid
      get unless @mbid
      @mbid
    end
    
    def events
      get_events unless @events
      @events
    end
    
    
    private
    
    def get_events
      response = call(events_method)
      @events = []
      response.each do |item|
        ev = BandsInTown::Event.new
        ev.url = item['url']
        ev.id = item['id']
        ev.ticket_status = item['ticket_status']
        ev.ticket_url = item['ticket_url']
        ev.on_sale_datetime = item['on_sale_datetime']
        ev.date_time = item['datetime']
        @events << ev
      end
    end
    
    def get
      response = call(get_method)
      @url = response['url']
      @upcoming_events_count = response['upcoming_events_count']
      @mbid = response['mbid']
    end
    
    def call(method)
      response = ''

      open("#{method}?app_id=#{APP_ID}") do |f|
        f.each_line {|line| response << line}
      end

      json = JSON response
    end
    
  end
end