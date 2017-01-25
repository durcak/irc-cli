require "typhoeus"

# ApiHelper module download data from https://api.mtgjester.com API
module ApiHelper
  # URL for target API
  URL = "https://api.mtgjester.com/cards/"
  
  class << self

    # Download data from API acording to given parameter.
    #
    # @param [String, #parameter] can be UUID or keyword
    # @return [String] the json string from API 
    def download_data(parameter)
  	  url = prepare_url parameter

  	  response = Typhoeus.get(url).body
    end

    private

    # Append parameter to the URL
    #
    # @param [String, #parameter] the parameter to append to URL
    # @return [String] the URL
    def prepare_url(parameter)
      "#{URL}#{parameter}"
    end
  end
end
