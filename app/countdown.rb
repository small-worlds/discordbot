require 'time'
require 'time_diff'
require 'date'

module Countdown
  extend Discordrb::Commands::CommandContainer

  waypoints = {
    'wp0' =>       Time.new(2018,5,26,  19,00,00, "+00:00"),
    'wp1' =>       Time.new(2018,5,29,  23,50,00, "+00:00"),
    'wp2' =>       Time.new(2018,5,31,  23,50,00, "+00:00"),
    'wp3' =>       Time.new(2018,6,2, 19,00,00, "+00:00"),
    'wp4' =>       Time.new(2018,6,5, 23,50,00, "+00:00"),
    'wp5' =>       Time.new(2018,6,7, 23,50,00, "+00:00"),
    'wp6' =>       Time.new(2018,6,9, 19,00,00, "+00:00"),
    'wp7' =>       Time.new(2018,6,12, 23,50,00, "+00:00"),
    'wp8' =>       Time.new(2018,6,14, 23,50,00, "+00:00"),
    'wp9' =>       Time.new(2018,6,16,  19,00,00, "+00:00"),
    # 'wp10' =>      Time.new(2018,7,6,  00,00,00, "+00:00"),
    # 'wp11' =>      Time.new(2018,7,8,  00,00,00, "+00:00"),
  }

  waypointseu = {
    'wp1' =>       Time.new(2018,5,29, 19,00,00, "+00:00"),
    'wp2' =>       Time.new(2018,5,31, 19,00,00, "+00:00"),
    'wp4' =>       Time.new(2018,6,5, 19,00,00, "+00:00"),
    'wp5' =>       Time.new(2018,6,7, 19,00,00, "+00:00"),
    'wp7' =>       Time.new(2018,6,12, 19,00,00, "+00:00"),
    'wp8' =>       Time.new(2018,7,14, 19,00,00, "+00:00"),
  }

  waypointsaus = {
    'wp1' =>       Time.new(2018,5,29,  10,00,00, "+00:00"),
    'wp2' =>       Time.new(2018,5,31,  10,00,00, "+00:00"),
    'wp4' =>       Time.new(2018,6,5, 10,00,00, "+00:00"),
    'wp5' =>       Time.new(2018,6,7, 10,00,00, "+00:00"),
    'wp7' =>       Time.new(2018,6,12, 10,00,00, "+00:00"),
    'wp8' =>       Time.new(2018,7,14,  10,00,00, "+00:00"),
  }


  command :countdown, description: 'Time until a given waypoint',
                      usage: 'countdown [<waypoint>]',
                      min_args: 0, max_args: 1 do |event, waypoint|
    curr_time = Time.now.utc
    unless waypoint && waypoints.key?(waypoint.downcase)
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

    output = "The time #{beforeafter} **#{waypoint}** is: **#{time}**"

    if waypointseu[waypoint.downcase]
      if curr_time < waypointseu[waypoint.downcase]
        timeeu = Time.diff(waypointseu[waypoint.downcase], Time.now.utc)[:diff]
        output += "\nThe time before **EU** meeting is: **#{timeeu}**"
      end
    end

    if waypointsaus[waypoint.downcase]
      if curr_time < waypointsaus[waypoint.downcase]
        timeaus = Time.diff(waypointsaus[waypoint.downcase], Time.now.utc)[:diff]
        output += "\nThe time before **AUS** meeting is: **#{timeaus}**"
      end
    end

    event.respond output
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
