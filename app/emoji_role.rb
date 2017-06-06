module EmojiRole
  extend Discordrb::EventContainer
  extend Roles
  extend Emojis
  
  # Message id we're looking for
  messageid=316293235700137984
  
  reaction_add(emoji: [Emojis::small_worlds]) do |event|
    alice=nil
    if event.message.id == messageid
      alice=event.author.add_role(Roles::SWE2)
    end
  end
  
  reaction_add(emoji: [Emojis::small_worlds_xbox]) do |event|
    barry=nil
    if event.message.id == messageid
      barry=event.author.add_role(Roles::SWE2Xbox)
    end
  end
  
  reaction_add(emoji: [Emojis::roleplayers]) do |event|
    candy=nil
    if event.message.id == messageid
      candy=event.author.add_role(Roles::Roleplayers)
    end
  end
end