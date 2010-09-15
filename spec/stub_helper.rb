module StubHelper
  
  def artist_search_response
    read_file "artist_search_response.json"
  end
  
  def artist_two_name_search_response
    read_file "artist_two_names.search_response.json"
  end
  
  private
  def read_file(file_name)
    response = ""
    File.open("#{File.dirname(__FILE__)}/stubs/#{file_name}", 'r') do |s|  
      while line = s.gets  
        response << line  
      end  
    end
    response
  end
end


