require 'time'
require 'time_diff'
require 'date'

module Countdown
  extend Discordrb::Commands::CommandContainer

  waypoints = {
    'wp6' => Time.new(2017,1,20,00,00,00, "+00:00"),
    'wp6launch' => Time.new(2017,1,20,1,00,00, "+00:00"),
    'wp7' => Time.new(2017,1,21,19,00,00, "+00:00"),
    'wp7launch' => Time.new(2017,1,21,20,00,00, "+00:00"),
    'wp8' => Time.new(2017,1,26,00,00,00, "+00:00"),
    'wp8launch' => Time.new(2017,1,26,1,00,00, "+00:00"),
    'wp9' => Time.new(2017,1,28,19,00,00, "+00:00"),
    'wp9launch' => Time.new(2017,1,28,20,00,00, "+00:00"),
    'wp10' => Time.new(2017,2,1,00,00,00, "+00:00"),
    'wp10launch' => Time.new(2017,2,1,1,00,00, "+00:00"),
    'wp11' => Time.new(2017,2,3,00,00,00, "+00:00"),
    'wp11launch' => Time.new(2017,2,3,1,00,00, "+00:00"),
    'wp12' => Time.new(2017,2,5,19,00,00, "+00:00"),
    'wp12launch' => Time.new(2017,2,5,20,00,00, "+00:00"),
    'wp13' => Time.new(2017,2,8,00,00,00, "+00:00"),
    'wp13launch' => Time.new(2017,2,8,1,00,00, "+00:00"),
    'wp14' => Time.new(2017,2,10,00,00,00, "+00:00"),
    'wp14launch' => Time.new(2017,2,10,1,00,00, "+00:00"),
    'wp15' => Time.new(2017,2,11,19,00,00, "+00:00")
  }

  command :countdown, description: 'Time until a given waypoint',
                      usage: 'countdown [<waypoint>]',
                      min_args: 0, max_args: 1 do |event, waypoint|
    unless waypoint && waypoints.key?(waypoint.downcase)
      curr_time = Time.now.utc
      waypoints.each do |wp,time|
        next if time < curr_time
        waypoint = wp
        break
      end
      if waypoint.nil?
        event.respond "The expedition has ended."
      end
    end

    time = Time.diff(waypoints[waypoint.downcase], Time.now.utc)[:diff]
    diff = waypoints[waypoint.downcase] <=> Time.now.utc
    if diff == 1
      beforeafter = 'until'
    else
      beforeafter = 'since'
    end

    "The time #{beforeafter} **#{waypoint}** is: **#{time}**"
  end

  command :time, description: 'What time is it in UTC (in-game time)?', usage: "time [<waypooint>]", min_args: 0, max_args: 1 do |event, waypoint|
    if waypoint && waypoints.key?(waypoint.downcase)
      time = waypoints[waypoint.downcase]
      event.respond "#{waypoint} is at **#{time}**"
    else
      time = Time.now.utc
      event.respond "The time is currently **#{time}**"
    end
  end
end
