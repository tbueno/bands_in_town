require "#{File.dirname(__FILE__)}/spec_helper"


describe "Artists calls: " do
  before(:all) do
    @artist = BandsInTown::Artists.get('wilco')
    @fail = BandsInTown::Artists.get('unknown_artist')
  end
  
  context "When making a valid call" do
    subject { @artist }
    it { should_not be_nil }
    
    specify { @artist.name.should == "wilco" }
    specify { @artist.url.should == "http://www.bandsintown.com/Wilco" } 
    specify { @artist.mbid.should == "9e53f84d-ef44-4c16-9677-5fd4d78cbd7d" }
    specify { @artist.upcoming_events_count.should == 10 }
  end
  
  context "When searching for an unexistent artist " do
    subject { @fail }
    it { should_not be_nil }
    
    specify { @fail.name.should == "unknown_artist" }
    specify { @fail.url.should be_nil } 
    specify { @fail.mbid.should be_nil }
    specify { @fail.upcoming_events_count.should be_nil}
  end
end
