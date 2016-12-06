#!/usr/bin/env ruby

require 'cinch'
require "./api_helper.rb"

# IRCBot
# Aplication connects to specified IRC channel and server and reacts to command from chat
# 
# #example limit: 10
# #example find: Air
# #example id: 11733148-a081-4652-bf9e-fba8cc4b3ee2
# #example showhelp
#
# #see ApiHelper#before
module IRCBOT
  bot = Cinch::Bot.new do
    
    # Configuration of IRC
    configure do |c|
      c.nick = "TestUloha5"
      c.server = "irc.freenode.net"
      c.channels = ["#municz-ruby"]
    end

    on :message, /id: *(.*)/ do |m, text|
      result = ApiHelper.new.table_string ApiHelper.new.download_data(text), $limit
      m.reply result
    end

    on :message, /find: *(.*)/ do |m, text|
      result = ApiHelper.new.table_string ApiHelper.new.download_data("search?query=#{text}"), $limit  
      m.reply result
    end

    on :message, /limit: *(.*)/ do |m, text|
      $limit = text.to_i  
      m.reply "Max number of shown cards setup to #{text}."
    end

    on :message, /showhelp/ do |m|
      help = "  
        id:\'id\'          --Show card with specified id.
        find:\'keyword\'   --Search cards by keyword.
        limit:\'number\'   --Set max number of return cards, default = 5.
        showhelp         --Show help."
      m.reply help
    end
  end

# Limit the number of rows printed to output
#
# @default value 5 rows
$limit = 5

# Starts the bot
bot.start
open("path/or/url/or/pipe", "w") { |io|  }

end