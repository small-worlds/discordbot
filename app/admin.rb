require 'json'

module Admin
  extend Discordrb::Commands::CommandContainer

  command :updateprofile, required_roles: [227522979104292864], help_available: false do |event|
  #Looks for the `botadmin` role
    event.bot.profile.username = 'Small Worlds'

    File.open('resources/avatar.jpg') do |f|
      event.bot.profile.avatar = f
    end

    # don't return anything when the command is run.
    nil
  end

### Disabling until we have an endpoint on the API for this.
### Or not. It's a wanted command.
  command :adddeath, required_roles: [314411525513150464], help_available: false do |event, *parse_string|
  #looks for the `Administration` role
    parse_string = parse_string.join(' ')
    parse_string = parse_string.split('-', 2)
    name = parse_string[0].gsub(/\s+$/, '')
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

    File.open('resources/lastdeath.json', 'w+') do |f|
      f.write(temp_hash.to_json)
    end

    "Womp womp. #{name} died at #{time} - #{reason}. New count: #{count}"
  end

  command :membercount, required_roles: [314411525513150464], help_available: false do |event| #"help_available: false" hides it from the help command.
    event.server.member_count # this returns a numerical value for server population automagically.
  end

  command :update, required_roles: [314411525513150464], help_available: false do |event|
  #Looks for the `Administration` role
    user = nil
    if system('git pull --ff-only')
      event.respond 'bot pulled cleanly!'
    else
      event.server.members.each do |member|
        next unless member.username == 'LaneAtomic'
        user = member
        break
      end
      append = user ? "PING #{user.mention}!" : 'Lane has left the server(!!!) - update the maintainer in this method!'
      event << "WARNING: bot did not cleanly pull! #{append}"
    end
  end

  command :restart, required_roles: [314411525513150464], help_available: false do |event|
    event.respond "Blame #{event.user.name}, restarting the bot."
    event.bot.stop #should "gracefully" stop the bot.
    pid = Process.exec('ruby bot.rb') #Spawn a copy of the bot's process.
    Process.detach pid #Kill the current one, switching to the new one automagically.
  end
end
