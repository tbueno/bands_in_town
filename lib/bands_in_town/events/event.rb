module BandsInTown
  module Events
    class Event
      
      attr_accessor :event_id, :url, :datetime, :ticket_url, :artists, :venue, :status, :ticket_status, :on_sale_datetime
      def initialize(event_id, url, datetime, ticket_url, artists, venue, status, ticket_status, on_sale_datetime)
        @event_id = event_id
        @url = url
        @datetime = datetime
        @ticket_url = ticket_url
        @artists = artists
        @venue = venue
        @status = status
        @ticket_status = ticket_status
        @on_sale_datetime = on_sale_datetime
      end
    end
  end
end