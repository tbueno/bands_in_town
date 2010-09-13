require "#{File.dirname(__FILE__)}/spec_helper"

describe "Artist" do
  
  GET_CALL = "http://api.bandsintown.com/artists/Pete%20Rock.json"
  EVENTS_CALL = "http://api.bandsintown.com/artists/Pete%20Rock/events.json"
  
  before do
    @artist = BandsInTown::Artist.new('Pete%20Rock')
  end
  
  subject do @artist.get_method 
    context "Get API method" do
      it { should_not be_nil }
      it { should == GET_CALL }
    end
  end
  
  subject do @artist.events_method 
    context "Events API method" do
      it { should_not be_nil }
      it { should == EVENTS_CALL }
    end
  end
  
end