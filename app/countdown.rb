require 'time'
require 'time_diff'
require 'date'

module Countdown
  extend Discordrb::Commands::CommandContainer

  waypoints = {
    'meetup' => Time.new(2016,9,10,19,00,00, "+00:00"),
    'wp0' => Time.new(2016,9,17,19,00,00, "+00:00"),
    'wp0launch' => Time.new(2016,9,17,19,30,00, "+00:00"),
    'wp1' => Time.new(2016,9,19,23,00,00, "+00:00"),
    'wp1launch' => Time.new(2016,9,19,23,45,00, "+00:00"),
    'wp2' => Time.new(2016,9,21,23,00,00, "+00:00"),
    'wp2launch' => Time.new(2016,9,21,23,45,00, "+00:00"),
    'wp3' => Time.new(2016,9,23,23,00,00, "+00:00"),
    'wp3launch' => Time.new(2016,9,23,23,45,00, "+00:00"),
    'wp4' => Time.new(2016,9,25,19,00,00, "+00:00"),
    'wp4launch' => Time.new(2016,9,25,19,45,00, "+00:00"),
    'wp5' => Time.new(2016,9,27,23,00,00, "+00:00"),
    'wp5launch' => Time.new(2016,9,27,23,45,00, "+00:00"),
    'ghostofjupiter' => Time.new(2016,9,29,00,00,00, "+00:00"),
    'wp6' => Time.new(2016,9,29,23,00,00, "+00:00"),
    'wp6launch' => Time.new(2016,9,29,23,45,00, "+00:00"),
    'wp7' => Time.new(2016,10,1,19,00,00, "+00:00"),
    'wp7launch' => Time.new(2016,10,1,19,45,00, "+00:00"),
    'wp8' => Time.new(2016,10,4,23,00,00, "+00:00"),
    'wp8launch' => Time.new(2016,10,4,23,45,00, "+00:00"),
    'wp9' => Time.new(2016,10,5,23,00,00, "+00:00"),
    'wp9launch' => Time.new(2016,10,5,23,45,00, "+00:00"),
    'wp10' => Time.new(2016,10,7,23,00,00, "+00:00")
  }

  command :countdown, description: 'Time until a given waypoint', usage: 'countdown [<waypoint>]', min_args: 0, max_args: 1 do |event, waypoint|
    unless waypoint && waypoints.key?(waypoint.downcase)
      curr_time = Time.now.utc
      waypoints.each do |wp,time|
        next if time < curr_time
        waypoint = wp
        break
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
