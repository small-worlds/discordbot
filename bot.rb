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
require './app/bearing_plotter.rb'
# require './app/expeditions.rb'
require './app/tableflip.rb'
require './app/move.rb'



settings = YAML.load_file('botconfig.yml')
if settings['token'].nil? || settings['client_id'].nil?
  puts '`token` and `client_id` are required! Please copy `botconfig.yml.example` to `botconfig.yml` and edit it with your credentials.'
  exit
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

  bot.reaction_add(emoji: 236127165010280458) do |event|
    dave=nil
    if event.message.id == 316293235700137984
      dave=event.user.on(191725064155168770)
      dave.add_role(308279505091559434)
    end
  end
  
  bot.reaction_add(emoji: 316295019097227264) do |event|
    dave=nil
    if event.message.id == 316293235700137984
      dave=event.user.on(191725064155168770)
      dave.add_role(308593158827278337)
    end
  end
  
  bot.reaction_add(emoji: 316295046704136202) do |event|
    dave=nil
    if event.message.id == 316293235700137984
      dave=event.user.on(191725064155168770)
      dave.add_role(214402788279582720)
    end
  end

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
bot.include! BearingPlotter
# bot.include! Expeditions
bot.include! TableFlip
bot.include! Move
bot.run unless ARGV[0] == "test"
