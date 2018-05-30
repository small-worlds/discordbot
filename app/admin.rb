require 'json'

module Admin
  extend Discordrb::Commands::CommandContainer
  extend Roles
  extend Channel
  extend NusePing
  extend PeopleID

  command :updateprofile, required_roles: [Roles::Botadmin], help_available: false do |event|
  #Looks for the `botadmin` role
    event.bot.profile.username = 'Small Worlds'

    File.open('resources/avatar.jpg') do |f|
      event.bot.profile.avatar = f
    end

    # don't return anything when the command is run.
    nil
  end

  command :membercount, required_roles: [Roles::Operators] do |event| #"help_available: false" hides it from the help command.
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
  
  command :dunce, required_roles: [Roles::Operators], description: 'Handing out dunce hats.', min_args: 1, max_args: 1 do |event, target|
    targeted = target.delete! '<@!>'
      dave = event.server.member(targeted)
      response = String.new
    if dave.roles == []
      response = "No roles"
    else
      dave.roles.each do |f|
        response << f.name
        response << ", "
      end
    end
    event.respond response
    dave.roles=Roles::Dunce
    sleep(1)
    event.server.move(dave, Channel::Corner)
  end
  
  command :nuse, required_roles: [Roles::Operators], description: "Toggling the ''Don't ping Nuse'' thing" do |event|
    if NusePing::NusePing == 0
      NusePing::NusePing = 1
      event.respond "Nuse may be pinged"
    elsif NusePing::NusePing == 1
      NusePing::NusePing =0
      event.respond "Nuse may not be pinged"
    end
  end
    
  command :troll, required_roles: [Roles::Operators], min_args: 0, max_args: 1, help_available: false do |event, type|
    if victim = event.server.member(PeopleID::Virtual)
      event.bot.voice_connect(victim.voice_channel)
      sleep(0.05)
      event.bot.voice(event.server.id).destroy
      nil
    end
  end
  
  command :groupup, required_roles: [Roles::Operators], description: "Supposed to move all admins and staff to the Conference room. What it actually does is unknown."do |event|
		event.server.voice_channels.each do |uh|
			if uh.id == Channel::Conference
				channel1=uh
			end
		end
		PeopleID.constants.each do |c|
			event.server.move(event.server.member(c), channel1)
		end
  end
  
end
