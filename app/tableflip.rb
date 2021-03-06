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
        event << "(╯°□°）╯︵ ┻━┻"
        isUnFlipped = false
        if (rand(201)==1)
          isBroken = true
          event << "\nСтол сломан! Пожалуйста исправьте!"
        end
        break
      else
        event << "Table already flipped ┻━┻"
        if (rand(71)==1)
          isBroken = true
          event << "\nСтол сломан! Пожалуйста исправьте!"
        end
        break
      end
    end
  end
  
  command :unflip, bucket: :slowdown, description: "Unflip those flipped tables. Poor table-kun" do |event|
    break if event.channel.id != Channel::Table #Same code as in lists.rb, forces use in a specific channel
    if isBroken
      event.respond "Стол сломан! Пожалуйста исправьте!"
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
    if isBroken = false
      event.respond "Таблица исправлена. Отставить!"
      isBroken = false
    else
      event.respond "Таблица не нарушена."
    end
  end
  
  command :shrug, description: "*shrugs*" do |event|
    event.respond "¯\\\_(ツ)\_/¯"
  end
end
