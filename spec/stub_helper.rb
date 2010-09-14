module StubHelper
  
  def artist_search_response
    response = ""
    File.open("#{File.dirname(__FILE__)}/stubs/artist_search_response.json", 'r') do |s|  
      while line = s.gets  
        response << line  
      end  
    end
    response
  end
end


