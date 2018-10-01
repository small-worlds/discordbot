# Small Worlds Discord Bot
require 'discordrb'
require 'yaml'

# Constants
require './rolesconfig.rb'

# App files
require './app/admin.rb'
require './app/bearing_plotter.rb'
require './app/context.rb'
require './app/countdown.rb'
require './app/custom_commands.rb'
require './app/deaths.rb'
require './app/emoji_role.rb'
require './app/gravity.rb'
require './app/lists.rb'
require './app/max_jump.rb'
require './app/move.rb'
require './app/roleplay.rb'
require './app/roles.rb'
require './app/tableflip.rb'
require './app/voice.rb'
require './app/utility.rb'
require './app/waterworldlogging.rb'

settings = YAML.load_file('botconfig.yml')
if settings['token'].nil? || settings['client_id'].nil?
  if ENV['TOKEN'].nil? || ENV['CLIENTID'].nil?
    puts '`token` and `client_id` are required! Please copy `botconfig.yml.example` to `botconfig.yml` and edit it with your credentials.'
    exit
  else
    settings['token'] = ENV['TOKEN']
    settings['client_id'] = ENV['CLIENTID']
  end
end

settings['prefix_char'] ||= '&'

case settings['log_mode'].downcase
when 'debug'
  log_mode = :debug
when 'verbose'
  log_mode = :verbose
when 'quiet'
  log_mode = :quiet
when 'silent'
  log_mode = :silent
else
  log_mode = :normal
end

bot = Discordrb::Commands::CommandBot.new token: settings['token'],
                                          client_id: settings['client_id'],
                                          prefix: settings['prefix_char'],
                                          advanced_functionality: false,
                                          log_mode: log_mode,
                                          command_doesnt_exist_message: "%command% is not a valid command! Use &help to get a list of current commands.",
                                          no_permission_message: "Error! Insufficient permissions to use command."

bot.bucket :memes, limit: 3, time_span: 60, delay: 10
bot.bucket :slowdown, limit: 1, time_span: 600, delay: 600

puts "Invite URL is #{bot.invite_url}"

# Load all bot modules
bot.include! Admin
bot.include! BearingPlotter
bot.include! Countdown
bot.include! CustomCommands
bot.include! Deaths
bot.include! EmojiRole
bot.include! GravityCalculator
bot.include! Listing
bot.include! MaxJumpCalculator
bot.include! Move
bot.include! NoContext
bot.include! PublicRoles
bot.include! Roleplay
bot.include! TableFlip
bot.include! Voice
bot.include! Utility
bot.include! WaterWorld
bot.run unless ARGV[0] == "test"
