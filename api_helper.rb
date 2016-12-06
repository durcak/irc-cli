require "typhoeus"
require "oj"
require 'table_print'
require 'stringio'


# ApiHelper class download data from https://api.mtgjester.com API
# and return them also in table format.

class ApiHelper
  # URL for target API
  URL = "https://api.mtgjester.com/cards/"

  # Download data from API acording to given parameter.
  #
  # @param [String, #parameter] can be UUID or keyword
  # @return [String] the json string from API 
  def download_data(parameter)
	url = prepare_url parameter

	response = Typhoeus.get(url).body
  end

  # Return Table format of given string.
  #
  # #param [String, #response] the string to convert to table format 
  # #param [Integer, #limit] the limit of return rows in table
  # #return [String] the table from response
  def table_string(response, limit = 5)
    pom = Oj.load(response, mode: :compat)
    pom = [] << pom if pom.class == Hash
    f = StringIO.new
    tp.set :io, f
    tp.set :max_width, 40
    tp pom.take limit
    return f.string
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
