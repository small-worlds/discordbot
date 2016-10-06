require 'json'

module Admin
  extend Discordrb::Commands::CommandContainer

  command :adddeath, help_available: false do |event, *parse_string|
    role = nil
    parse_string = parse_string.join(' ')
    parse_string = parse_string.split('-', 2)
    name = parse_string[0].chomp
    reason = parse_string[1].chomp.gsub!(/^\s+/, '')

    puts name
    puts reason

    event.server.roles.each do |server_role|
      next unless server_role.name == 'botadmin'
      role = server_role
      break
    end

    break unless event.user.role?(role)

    file = File.read('resources/lastdeath.json')
    data_hash= JSON.parse(file)
    count = data_hash['count'] + 1
    time = Time.now.utc

    temp_hash = {
        'name' => name,
        'reason' => reason,
        'timestamp' => time,
        'count' => count
    }

    file = File.open('resources/lastdeath.json', 'w+') do |f|
      f.write(temp_hash.to_json)
    end

    "Womp womp. #{name} died at #{time} - #{reason}. New count: #{count}"
  end
end
