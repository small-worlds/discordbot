module WaterWorld
  extend Discordrb::Commands::CommandContainer
  extend Roles
  extend Channel
  
  command :log, required_roles: [Roles::Kruger], description: 'Log a found waterworld. Usage: <System> : <Planet code>', usage: "<System> : <Planet code>" do |event, *parse_string| # fyi, this requires the SaudKruiger role.
    parse_string = parse_string.join(' ') #lane's code
    parse_string = parse_string.split(':', 2) #splits the string on the ':'
    system = parse_string[0].gsub(/\s+$/, '') #lane's code, no idea.
    planet_code = parse_string[1].chomp.gsub!(/^\s+/, '') #also lane's code
    
    event.bot.send_message(Channel::WaterWorld, event.author.display_name + ","+ system + "," + planet_code) #Sends the display/nickname of the command executor, the value of "system", and the value of "planet_code" to the channel WaterWorld, defined in the module "Channel"
  end
end
