module Utility
  extend Discordrb::EventContainer
  
  member_join do |event|
    channel12 = nil
    # Object
    channel13 = 321347260099198986
    # Interger
    output = event.user.username + " joined the server"
    # Output message
    event.server.channels.each do |carl|
    # For each of the channels on this server, do the following:
      if carl.id == channel13
      # Does it's id match channel13's?
        channel12 = carl
        # If so, give the object to channel12
      end
    end
    channel12.send(output)
    # Send the contents of output to channel12 
  end
  
  member_leave do |event|
    channel14 = nil
    # Object
    channel15 = 321347260099198986
    # Interger
    output = event.user.username + " left the server"
    # Output message
    event.server.channels.each do |carl|
    # For each of the channels on this server, do the following:
      if carl.id == channel15
      # Does it's id match channel15's?
        channel14 = carl
        # If so, give the object to channel14
      end
    end
    channel14.send(output)
    # Send the contents of output to channel14 
  end
end
