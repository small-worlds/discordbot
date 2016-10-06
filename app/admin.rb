require 'json'

module Admin
  extend Discordrb::Commands::CommandContainer

  def self.find_role(event, role)
    role = nil
    event.server.roles.each do |server_role|
      next unless server_role.name == 'botadmin'
      role = server_role
    end
    return role
  end

  command :updateprofile, help_available: false do |event|
    role = find_role(event, 'botadmin')
    break unless event.user.role?(role)

    event.bot.profile.username = 'Small Worlds'
    avatar = File.open('resources/avatar.jpg')
    event.bot.profile.avatar = avatar
    avatar.close

    # don't return anything when the command is run.
    nil
  end

  command :adddeath, help_available: false do |event, *parse_string|
    role = find_role(event, 'botadmin')
    break unless event.user.role?(role)

    parse_string = parse_string.join(' ')
    parse_string = parse_string.split('-', 2)
    name = parse_string[0].chomp
    reason = parse_string[1].chomp.gsub!(/^\s+/, '')

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
