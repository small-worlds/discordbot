module Utility
  extend Discordrb::EventContainer
  
  Swebotoutput = 321347260099198986 #swebot-output

  member_join do |event|
    bot.send_message(Swebotoutput, event.user.username + " joined the server")
  end
  
  member_leave do |event|
    bot.send_message(Swebotoutput, event.user.username + " left the server")
  end
end
