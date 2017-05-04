module TableFlip
  extend Discordrb::Commands::CommandContainer
  
  isUnFlipped = true
  
  command :tableflip, description: "For those mobile users to flip tables too." do |event|
    if isUnFlipped
      event.respond "(╯°□°）╯︵ ┻━┻"
      isUnFlipped = false
      break
    else
      event.respond "table already flipped ┻━┻"
      break
    end
  end
  
  command :unflip, description: "Unflip those flipped tables. Poor table-kun" do |event|
    if isUnFlipped
      event.respond "table already upright ┬─┬"
      break
    else
      event.respond "┬─┬﻿ ノ( ゜-゜ノ)"
      isUnFlipped = true
      break
    end
  end
  
  command :shrug, description: "*shrugs*" do |event|
    event.respond "¯\\\_(ツ)\_/¯"
  end
end
