require "#{File.dirname(__FILE__)}/spec_helper"


describe "Artists calls: " do
  
  before(:all) do
    @artist = BandsInTown::Artists.get('wilco')
    @artist2 = BandsInTown::Artists.get('Guided By Voices')
    @fail = BandsInTown::Artists.get('unknown_artist')
    
  end
  
  context "When making a valid call" do
    
    subject { @artist }
    it { should_not be_nil }
    
    specify { @artist.name.should == "wilco" }
    specify { @artist.url.should == "http://www.bandsintown.com/Wilco" } 
    specify { @artist.mbid.should == "9e53f84d-ef44-4c16-9677-5fd4d78cbd7d" }
    specify { @artist.upcoming_events_count.should == 10 }
    
    context "When searching for an artist with invalid strange characters" do
      
      subject { @artist2 }
      it { should_not be_nil }
      specify { @artist2.name.should == "Guided By Voices" }
      specify { @artist2.url.should == "http://www.bandsintown.com/GuidedByVoices" } 
      specify { @artist2.mbid.should == "6c85f4c3-026c-4c16-9a7c-f546f42ed0fb" }
      specify { @artist2.upcoming_events_count.should == 19 }
      
      
    end
  end
  
  context "When making an invalid call" do
    context "When searching for an unexistent artist " do
      subject { @fail }
      it { should_not be_nil }
    
      specify { @fail.name.should == "unknown_artist" }
      specify { @fail.url.should be_nil } 
      specify { @fail.mbid.should be_nil }
      specify { @fail.upcoming_events_count.should be_nil}
    end
  end
end
