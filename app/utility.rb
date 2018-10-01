module Utility
  extend Discordrb::EventContainer
  extend Roles
  extend Server
  extend Channel
  extend People
  extend NusePing

  member_join do |event|
    event.bot.send_message(Channel::Swebotoutput, event.user.username + " joined the server")
    if(event.user.username.include? "discord.gg")
      server.kick(event.user)
    end
  end
  
  member_leave do |event|
    event.bot.send_message(Channel::Swebotoutput, event.user.username + " left the server")
  end

#this is now L E G A C Y C O D E
=begin
  voice_state_update do |event|
    idiot = event.user.on(Server::Server)
    if idiot.voice_channel == nil && idiot.role?(Roles::Voice)
      idiot.remove_role(Roles::Voice)
    elsif idiot.voice_channel != nil && idiot.role?(Roles::Voice) == false
      idiot.add_role(Roles::Voice)
    end
  end
=end

  message(contains: People::Nuse) do |event|
    if NusePing::NusePing == 0
      alpha = event.author
      alpha.pm("Stop that, Nuse doesn't like pings.")
      beta = event.channel
      beta.send "#{alpha.mention} Please don't ping Nuse."
    end
  end
	
  ready do |event|
    event.bot.send_message(Channel::Swebotoutput, "Reboot complete")
  end
end
