module EmojiRole
  extend Discordrb::EventContainer
  extend Roles
  extend Emojis
  
  # Message id we're looking for
  messageid=316293235700137984
  
  reaction_add(emoji: [Emojis::SMALL_WORLDS]) do |event|
    alice=nil
    if event.message.id == messageid
      alice=event.user.on(191725064155168770)
      alice.add_role(Roles::SWE2)
    end
  end
  
  reaction_add(emoji: [Emojis::XBOX]) do |event|
    barry=nil
    if event.message.id == messageid
      barry=event.user.on(191725064155168770)
      barry.add_role(Roles::SWE2Xbox)
    end
  end
  
  reaction_add(emoji: [Emojis::ROLEPLAYERS]) do |event|
    candy=nil
    if event.message.id == messageid
      candy=event.user.on(191725064155168770)
      candy.add_role(Roles::Roleplayers)
    end
  end
end
