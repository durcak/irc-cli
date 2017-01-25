#!/usr/bin/env ruby

require "slop"
require "./api_helper"
require "./format_helper.rb"

# Cli service
# Aplication reacts to ARGV arguments, downloads and shows data from https://api.mtgjester.com API
# 
# #example ./cli_service.rb -f Air -l 2
# #example ./cli_service.rb -u 11733148-a081-4652-bf9e-fba8cc4b3ee2
# #example ./cli_service.rb -h
# #see ApiHelper#before
module CLI_SERVICE
  include ApiHelper
  include FormatHelper

  opts = Slop.parse do |o|
  	o.string '-u', '--uuid', 'Show card with specific ID.'
  	o.string '-f', '--find', 'Search cards by kezywords.'
  	o.integer '-l', '--limit', 'Set max number of return cards, default = 5.', default: 5
  	o.on '-h', '--help', 'Show help.'
  end

  # Print ApiHelper output in table format acording to given id 
  if opts[:u]
    puts FormatHelper.table_string ApiHelper.download_data(opts[:u]), opts[:limit]
  end

  # Print ApiHelper output in table format acording to given keyword 
  if opts[:f]
    puts FormatHelper.table_string ApiHelper.download_data("search?query=#{opts[:f]}"), opts[:limit]
  end

  # Print help
  if opts[:h]
    puts opts
  end
end