require 'json'

module Admin
  extend Discordrb::Commands::CommandContainer
  extend Roles

  command :updateprofile, required_roles: [Roles::Botadmin], help_available: false do |event|
  #Looks for the `botadmin` role
    event.bot.profile.username = 'Small Worlds'

    File.open('resources/avatar.jpg') do |f|
      event.bot.profile.avatar = f
    end

    # don't return anything when the command is run.
    nil
  end

  command :membercount, required_roles: [Roles::Operators], help_available: false do |event| #"help_available: false" hides it from the help command.
    event.server.member_count # this returns a numerical value for server population automagically.
  end

  command :update, required_roles: [Roles::Operators], help_available: false do |event|
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

  command :restart, required_roles: [Roles::Operators], help_available: false do |event|
    event.respond "Blame #{event.user.name}, restarting the bot."
    event.bot.stop #should "gracefully" stop the bot.
    pid = Process.exec('ruby bot.rb') #Spawn a copy of the bot's process.
    Process.detach pid #Kill the current one, switching to the new one automagically.
  end

  command :shutdown, required_roles: [Roles::Operators], description: 'Stop the bot!' do |event|
    event.respond "Blame #{event.user.name}, stopping the bot."
    event.bot.stop
  end
end
