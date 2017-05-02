module Move
  extend Discordrb::Commands::CommandContainer

  command :move, description: "m", min_args: 2, max_args: 2 do |event, c1, c2|
    channel1=nil
    channel2=nil
    event.server.channels.each do |c|
      if c.name == c1
        channel1=c
      end
      if c.name == c2
        channel2=c
      end
    end
    if not channel1
      event.respond 'Channel 1 not found'
    end
    if not channel2
      event.respond 'Channel 2 not found'
    end
    event.respond 'Moving'
    channel1.users.each do |u|
      event.server.move(u,channel2)
    end
    #event.server.move(event.user, channel)
  end
end
