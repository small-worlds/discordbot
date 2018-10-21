module TableFlip
  extend Discordrb::Commands::CommandContainer
  
  isUnFlipped = true
  isBroken = false
  
  command :tableflip, bucket: :slowdown, description: "For those mobile users to flip tables too." do |event|
    break if event.channel.id != Channel::Table
    if isBroken
      event.respond "Table is broken! Please fix!"
    else
      if isUnFlipped
        event.respond "(╯°□°）╯︵ ┻━┻"
        isUnFlipped = false
        if (rand>=0)
          isBroken = true
        end
        break
      else
        event.respond "Table already flipped ┻━┻"
        if (rand>=0.7)
          isBroken = true
        end
        break
      end
    end
  end
  
  command :unflip, bucket: :slowdown, description: "Unflip those flipped tables. Poor table-kun" do |event|
    break if event.channel.id != Channel::Table #Same code as in lists.rb, forces use in a specific channel
    if isBroken
      event.respond "Table is broken! Please fix!"
    else
      if isUnFlipped
        event.respond "table already upright ┬─┬"
        break
      else
        event.respond "┬─┬﻿ ノ( ゜-゜ノ)"
        isUnFlipped = true
        break
      end
    end
  end
  
  command :fix, description: "Fixes a broken table" do |event|
    break if event.channel.id != Channel::Table
    isBroken = false
    event.respond "Table is fixed. As you were!"
  end
  
  command :shrug, description: "*shrugs*" do |event|
    event.respond "¯\\\_(ツ)\_/¯"
  end
end
