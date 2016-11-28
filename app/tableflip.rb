module TableFlip
  extend Discordrb::Commands::CommandContainer
  
  command :tableflip, description: "For those mobile users to flip tables too." do |event|
    event.respond "(╯°□°）╯︵ ┻━┻"
  end
  
  command :unflip, description: "Unflip those flipped tables. Poor table-kun" do |event|
    event.respond "┬─┬﻿ ノ( ゜-゜ノ)"
   end
end
