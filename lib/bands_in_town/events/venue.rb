module BandsInTown
  module Events
    class Venue
      attr_reader :venue_id, :url, :region, :city, :name, :country, :latitude, :longitude
      def initialize(venue_id, url, region, city, name, country, latitude, longitude)
        @venue_id = venue_id
        @url = url
        @region = region
        @city = city
        @name = name
        @country = country
        @latitude = latitude
        @longitude = longitude
      end
    end
  end
end
