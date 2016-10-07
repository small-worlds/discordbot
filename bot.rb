# Discord Roleplay Bot
require 'discordrb'
require 'yaml'

# App files
require './app/custom_commands.rb'
require './app/voice.rb'
require './app/max_jump.rb'
require './app/context.rb'
require './app/roleplay.rb'
require './app/countdown.rb'
require './app/roles.rb'
require './app/gravity.rb'
require './app/admin.rb'
require './app/lists.rb'

settings = YAML.load_file('botconfig.yml')
if settings['token'].nil? && settings['application_id'].nil?
  puts '`token` and `application_id` are required! Please copy `botconfig.yml.example` to `botconfig.yml` and edit it with your credentials.'
  exit
end

settings['prefix_char'] ||= '&'

bot = Discordrb::Commands::CommandBot.new token: settings['token'], application_id: settings['application_id'], prefix: settings['prefix_char'], advanced_functionality: false

bot.bucket :memes, limit: 3, time_span: 60, delay: 10

puts "Invite URL is #{bot.invite_url}"

bot.include! CustomCommands
bot.include! Voice
bot.include! MaxJumpCalculator
bot.include! NoContext
bot.include! Roleplay
bot.include! Countdown
bot.include! PublicRoles
bot.include! GravityCalculator
bot.include! Admin
bot.include! Listing
bot.run
