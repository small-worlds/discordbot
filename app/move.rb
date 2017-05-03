module Move
  extend Discordrb::Commands::CommandContainer

  command :move, help_available: false, min_args: 2, max_args: 2 do |event, c1, c2|
    ok=nil
    event.user.roles.each do |role|
      if ["Management","Administration"].include?(role.name)
        ok=1
        break
      end
    end
    break unless ok

    channel1=nil
    channel2=nil
    event.server.channels.each do |c|
      if c.name == c1 and c.voice?
        channel1=c
      end
      if c.name == c2 and c.voice?
        channel2=c
      end
    end
    if not channel1
      event.respond 'Channel 1 not found or not a voice channel'
      break
    end
    if not channel2
      event.respond 'Channel 2 not found or not a voice channel'
      break
    end
    event.respond 'Moving'
    channel1.users.each do |u|
      event.server.move(u,channel2)
    end
  end
end
