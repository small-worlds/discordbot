module Utility
  extend Discordrb::EventContainer
  
  swebotoutput = 321347260099198986 #swebot-output

  member_join do |event|
    event.server.channels.each do |ch|
      if ch.id == swebotoutput
        ch.send(event.user.username + " joined the server")
      end
    end
  end
  
  member_leave do |event|
    event.server.channels.each do |ch|
      if ch.id == swebotoutput
        ch.send(event.user.username + " left the server")
      end
    end
  end
end
