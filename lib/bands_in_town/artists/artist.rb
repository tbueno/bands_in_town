require 'rubygems'
require 'open-uri'
require 'json' 

module BandsInTown
  module Artists
    class Artist
     
      attr_reader :name, :mbid, :url, :upcoming_events_count
    
      def initialize(name, url, mbid, upcoming_events_count)
        @name = name
        @url = url
        @mbid = mbid
        @upcoming_events_count = upcoming_events_count
      end
    end
  end
end