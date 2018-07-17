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
  
  reaction_add(emoji: [Emojis::PLANE]) do |event|
    addrole(event, Roles::FlightClub) #DCS
  end
  
  reaction_add(emoji: [Emojis::STARCITIZEN]) do |event|
    addrole(event, Roles::StarCitizen) #Star Citizen
  end
  
  reaction_add(emoji: [Emojis::LOTUS]) do |event|
    addrole(event, Roles::Tenno) #Warframe channel perms
  end
  
  reaction_add(emoji: [Emojis::XBOX]) do |event|
    addrole(event, Roles::XBOX) #Xbox
  end
  
  reaction_add(emoji: [Emojis::PS]) do |event|
    addrole(event, Roles::PS) #PS4
  end

  reaction_add(emoji: [Emojis::VR]) do |event|
    addrole(event, Roles::VR) #VR
  end
  
  # reaction_add(emoji: [Emojis::ORCA]) do |event|
    # addrole(event, Roles::Kruger) #SWE Winter expo 3 (Saud Kruger Beacon tour)
  # end
  
  # reaction_add(emoji: [Emojis::SWE3]) do |event|
    # addrole(event, Roles::SWE3) #Small Worlds Three!
  # end
  
  # reaction_add(emoji: [Emojis::ONIONHEAD]) do |event|
    # addrole(event, Roles::Jerek) #Unplanned beagle expo
  # end
  
  # reaction_add(emoji: [Emojis::ROLEPLAYERS]) do |event|
    # addrole(event, Roles::Roleplayers) #Unused
  # end
  
  # reaction_add(emoji: [Emojis::ROLEPLAYERS]) do |event|
    # addrole(event, Roles::Roleplayers) #Unused
  # end
  
  # reaction_add(emoji: [Emojis::ROLEPLAYERS]) do |event|
    # addrole(event, Roles::Roleplayers) #Unused
  # end

end
