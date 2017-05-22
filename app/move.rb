module Move
  extend Discordrb::Commands::CommandContainer

  command :move, help_available: false, required_roles: [314411525513150464], min_args: 2, max_args: 2 do |event, c1, c2|
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
  
  command :mute, help_available: false, required_roles: [314411525513150464], min_args: 1, max_args: 1 do |event, dave|
    channel1=nil
    event.server.channels.each do |carl|
      if carl.name == dave and carl.voice?
        channel1=carl
      end
    end
    event.respond "And there was silence in " << channel1.name
    channel.users.each do |u|
      u.server_mute
      sleep(0.01)
    end
  end
end
