module Utility
  extend Discordrb::EventContainer
  extend Roles
  extend Server
  extend Channel
  extend People

  member_join do |event|
    event.bot.send_message(Channel::Swebotoutput, event.user.username + " joined the server")
  end
  
  member_leave do |event|
    event.bot.send_message(Channel::Swebotoutput, event.user.username + " left the server")
  end

  voice_state_update do |event|
    idiot = event.user.on(Server::Server)
    if idiot.voice_channel == nil && idiot.role?(Roles::Voice)
      idiot.remove_role(Roles::Voice)
    elsif idiot.voice_channel != nil && idiot.role?(Roles::Voice) == false
      idiot.add_role(Roles::Voice)
    end
  end

  message(contains: People::Ravstar) do |event|
    alpha = event.author
    alpha.pm("Stop that, #{event.message.mentions} doesn't like pings.")
    beta = event.channel
    beta.send "#{alpha.mention} Please don't ping them."
  end
end
