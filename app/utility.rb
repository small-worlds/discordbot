module Utility
  extend Discordrb::EventContainer
  
  member_join do |event|
    channel1 = nil
    # Object
    channel2 = 321347260099198986
    # Integer
    output = event.user.username + " joined the server"
    # Output message
    event.server.channels.each do |event|
    # For each of the channels on this server, do the following:
      if event.id == channel2
      # Does it's id match channel2's?
        channel1 = event
        # If so, give the object to channel1
      end
    end
    channel1.send(output)
    # Send the contents of output to channel1 
  end
  
  member_leave do |event|
    channel1 = nil
    channel2 = 321347260099198986
    output = event.user.username + " left the server"
    event.server.channels.each do |event|
      if event.id == channel2
        channel1 = event
      end
    end
    channel1.send(output)
  end
end
