module EmojiRole
  extend Discordrb::EventContainer
  extend Roles
  extend Emojis
  extend Message
  extend Server

  reaction_add(emoji: [Emojis::SMALL_WORLDS]) do |event|
    alice=nil
    if event.message.id == Message::MESSAGEID
      alice=event.user.on(Server::Server)
      alice.add_role(Roles::SWE2)
    end
  end
  
  reaction_add(emoji: [Emojis::XBOX]) do |event|
    barry=nil
    if event.message.id == Message::MESSAGEID
      barry=event.user.on(Server::Server)
      barry.add_role(Roles::SWE2Xbox)
    end
  end
  
  reaction_add(emoji: [Emojis::ROLEPLAYERS]) do |event|
    candy=nil
    if event.message.id == Message::MESSAGEID
      candy=event.user.on(Server::Server)
      candy.add_role(Roles::Roleplayers)
    end
  end
end
