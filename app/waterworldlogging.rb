module WaterWorld
  extend Discordrb::Commands::CommandContainer
  extend Roles
  extend Channel
  
  command :log, required_roles: [Roles::Kruger], description: 'Log a found waterworld. Usage: <System> : <Planet code>', usage: "<System> : <Planet code>" do |event, *parse_string|
    parse_string = parse_string.join(' ')
    parse_string = parse_string.split(':', 2)
    system = parse_string[0].gsub(/\s+$/, '')
    planet_code = parse_string[1].chomp.gsub!(/^\s+/, '')
    
    event.bot.send_message(Channel::WaterWorld, "WW found, system: " + system + "\nPlanet: " + planet_code + "\nCommander: " + event.author.display_name)
  end
end
