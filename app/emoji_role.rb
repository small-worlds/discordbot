module EmojiRole
  extend Discordrb::EventContainer
  extend Roles
  extend Emojis
  extend Message
  extend Server
  
  def self.addrole(event, role) #Creates a method with two inputs, the event handler and the role to be added
    if event.message.id == Message::MESSAGEID  #checking the message the emoji is on is the right on
      event.user.on(Server::Server).add_role(role) #apply role to forehead
    end
  end

  reaction_add(emoji: [Emojis::ROLEPLAYERS]) do |event|
    addrole(event, Roles::Roleplayers) #Roleplayers
  end
  
  reaction_add(emoji: [Emojis::ONIONHEAD]) do |event|
    addrole(event, Roles::Jerek) #Unplanned beagle expo
  end
  
  reaction_add(emoji: [Emojis::PLANE]) do |event|
    addrole(event, Roles::FlightClub) #DCS
  end
  
  reaction_add(emoji: [Emojis::STARCITIZEN]) do |event|
    addrole(event, Roles::StarCitizen) #Star Citizen
  end
  
  reaction_add(emoji: [Emojis::ORCA]) do |event|
    addrole(event, Roles::Kruger) #SWE Winter expo 3 (Saud Kruger Beacon tour)
  end
  
  # reaction_add(emoji: [Emojis::ROLEPLAYERS]) do |event|
    # addrole(event, Roles::Roleplayers) #Unused
  # end
  
  # reaction_add(emoji: [Emojis::ROLEPLAYERS]) do |event|
    # addrole(event, Roles::Roleplayers) #Unused
  # end
  
  # reaction_add(emoji: [Emojis::ROLEPLAYERS]) do |event|
    # addrole(event, Roles::Roleplayers) #Unused
  # end

  # reaction_add(emoji: [Emojis::SMALL_WORLDS]) do |event|
    # alice=nil
    # if event.message.id == Message::MESSAGEID
      # alice=event.user.on(Server::Server)
      # alice.add_role(Roles::SWE2)
    # end
  # end
  
  # reaction_add(emoji: [Emojis::XBOX]) do |event|
    # barry=nil
    # if event.message.id == Message::MESSAGEID
      # barry=event.user.on(Server::Server)
      # barry.add_role(Roles::SWE2Xbox)
    # end
  # end
  
  # reaction_add(emoji: [Emojis::ROLEPLAYERS]) do |event|
    # candy=nil
    # if event.message.id == Message::MESSAGEID
      # candy=event.user.on(Server::Server)
      # candy.add_role(Roles::Roleplayers)
    # end
  # end
  
  # reaction_add(emoji: [Emojis::ONIONHEAD]) do |event|
    # delta=nil
    # if event.message.id == Message::MESSAGEID
      # delta=event.user.on(Server::Server)
      # delta.add_role(Roles::Jerek)
    # end
  # end
  
  # reaction_add(emoji: [Emojis::PLANE]) do |event|
    # ecchi=nil
    # if event.message.id == Message::MESSAGEID
      # ecchi=event.user.on(Server::Server)
      # ecchi.add_role(Roles::FlightClub)
    # end
  # end
  
  # reaction_add(emoji: [Emojis::STARCITIZEN]) do |event|
    # foxtrot=nil
    # if event.message.id == Message::MESSAGEID
      # foxtrot=event.user.on(Server::Server)
      # foxtrot.add_role(Roles::StarCitizen)
    # end
  # end
  
  # reaction_add(emoji: [Emojis::ORCA]) do |event|
    # hotel=nil
    # if event.message.id == Message::MESSAGEID
      # hotel=event.user.on(Server::Server)
      # hotel.add_role(Roles::Kruger)
    # end
  # end
end
