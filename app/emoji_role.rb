module EmojiRole
  extend Discordrb::EventContainer
  
  reaction_add(emoji: 236127165010280458) do |event|
    alice=nil
    if event.message.id == 316293235700137984
      alice=event.user.on(191725064155168770)
      alice.add_role(308279505091559434)
    end
  end
  
  reaction_add(emoji: 316295019097227264) do |event|
    barry=nil
    if event.message.id == 316293235700137984
      barry=event.user.on(191725064155168770)
      barry.add_role(308593158827278337)
    end
  end
  
  reaction_add(emoji: 316295046704136202) do |event|
    candy=nil
    if event.message.id == 316293235700137984
      candy=event.user.on(191725064155168770)
      candy.add_role(214402788279582720)
    end
  end
end