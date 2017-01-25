require "oj"
require 'table_print'
require 'stringio'

#FormatHelper return given data in form of table.

module FormatHelper
	# Return Table format of given string.
	#
	# #param [String, #response] the string to convert to table format 
	# #param [Integer, #limit] the limit of return rows in table
	# #return [String] the table from response
	def self.table_string(response, limit = 5)
	  pom = Oj.load(response, mode: :compat)
	  pom = [] << pom if pom.class == Hash
	  f = StringIO.new
	  tp.set :io, f
	  tp.set :max_width, 40
	  tp pom.take limit
	  return f.string
	end
end