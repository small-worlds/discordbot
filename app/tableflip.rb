module TableFlip
  extend Discordrb::Commands::CommandContainer
  
  isUnFlipped = true
  
  command :tableflip, description: "For those mobile users to flip tables too." do |event|
    break unless isUnFlipped
    event.respond "(╯°□°）╯︵ ┻━┻"
    isUnFlipped = false
  end
  
  command :unflip, description: "Unflip those flipped tables. Poor table-kun" do |event|
    event.respond "┬─┬﻿ ノ( ゜-゜ノ)"
    isUnFlipped = true
  end
  
  command :shrug, description: "*shrugs*" do |event|
    event.respond "¯\\\_(ツ)\_/¯"
  end
end
