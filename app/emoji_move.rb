module EmojiRole
  extend Discordrb::EventContainer
  
  reaction_add(emoji: 236127165010280458) do |event|
    dave=nil
    if event.message.id == 316293235700137984
      dave=event.user.on(191725064155168770)
      dave.add_role(308279505091559434)
    end
  end
  
  reaction_add(emoji: 316295019097227264) do |event|
    dave=nil
    if event.message.id == 316293235700137984
      dave=event.user.on(191725064155168770)
      dave.add_role(308593158827278337)
    end
  end
  
  reaction_add(emoji: 316295046704136202) do |event|
    dave=nil
    if event.message.id == 316293235700137984
      dave=event.user.on(191725064155168770)
      dave.add_role(308279505091559434)
    end
  end
end