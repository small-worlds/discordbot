require 'time'
require 'time_diff'
require 'date'

module Countdown
  extend Discordrb::Commands::CommandContainer

  waypoints = {
    #'wp0' =>       Time.new(2018,9,8, 18,00,00, "+00:00"),
    #'wp1' =>       Time.new(2018,9,8,  18,00,00, "+00:00"),
    #'wp2' =>       Time.new(2018,9,11, 23,59,59, "+00:00"),
    #'wp3' =>       Time.new(2018,9,12,  18,00,00, "+00:00"),
    #'wp4' =>       Time.new(2018,9,15,  23,50,00, "+00:00"),
    #'wp5' =>       Time.new(2018,9,18,  23,50,00, "+00:00"),
    #'wp6' =>       Time.new(2018,9,20,  18,00,00, "+00:00"),
    #'wp7' =>       Time.new(2018,9,22, 23,50,00, "+00:00"),
    #'wp8' =>       Time.new(2018,9,25, 23,50,00, "+00:00"),
    #'wp9' =>       Time.new(2018,9,29, 18,00,00, "+00:00"),
    #'wp10' =>      Time.new(2018,10,2,  00,00,00, "+00:00"),
    #'wp11' =>      Time.new(2018,10,8,  00,00,00, "+00:00"),
  }
  
  jumpna = {
    #'wp0' =>       Time.new(2018,9,8, 19,00,00, "+00:00"),
    #'wp1' =>       Time.new(2018,9,12, 01,00,00, "+00:00"),
    #'wp2' =>       Time.new(2018,6,1,  01,00,00, "+00:00"),
    #'wp3' =>       Time.new(2018,6,2,  19,00,00, "+00:00"),
    #'wp4' =>       Time.new(2018,6,6,  01,00,00, "+00:00"),
    #'wp5' =>       Time.new(2018,6,8,  01,00,00, "+00:00"),
    #'wp6' =>       Time.new(2018,6,9,  19,00,00, "+00:00"),
    #'wp7' =>       Time.new(2018,6,13, 01,00,00, "+00:00"),
    #'wp8' =>       Time.new(2018,6,15, 01,00,00, "+00:00"),
    #'wp9' =>       Time.new(2018,6,16, 19,00,00, "+00:00"),
  }

  waypointseu = {
    #'wp1' =>       Time.new(2018,9,8, 18,00,00, "+00:00"),
    #'wp2' =>       Time.new(2018,5,31, 19,00,00, "+00:00"),
    #'wp4' =>       Time.new(2018,6,5,  19,00,00, "+00:00"),
    #'wp5' =>       Time.new(2018,6,7,  19,00,00, "+00:00"),
    #'wp7' =>       Time.new(2018,6,12, 19,00,00, "+00:00"),
    #'wp8' =>       Time.new(2018,6,14, 19,00,00, "+00:00"),
  }
  
  jumpeu={
    #'wp1' =>       Time.new(2018,5,29, 20,00,00, "+00:00"),
    #'wp2' =>       Time.new(2018,5,31, 20,00,00, "+00:00"),
    #'wp4' =>       Time.new(2018,6,5,  20,00,00, "+00:00"),
    #'wp5' =>       Time.new(2018,6,7,  20,00,00, "+00:00"),
    #'wp7' =>       Time.new(2018,6,12, 20,00,00, "+00:00"),
    #'wp8' =>       Time.new(2018,6,14, 20,00,00, "+00:00"),
  }

  waypointsaus = {
    #'wp1' =>       Time.new(2018,5,29, 10,00,00, "+00:00"),
    #'wp2' =>       Time.new(2018,5,31, 10,00,00, "+00:00"),
    #'wp4' =>       Time.new(2018,6,5,  10,00,00, "+00:00"),
    #'wp5' =>       Time.new(2018,6,7,  10,00,00, "+00:00"),
    #'wp7' =>       Time.new(2018,6,12, 10,00,00, "+00:00"),
    #'wp8' =>       Time.new(2018,6,14, 10,00,00, "+00:00"),
  }
  
  jumpaus = {
    #'wp1' =>       Time.new(2018,5,29, 11,00,00, "+00:00"),
    #'wp2' =>       Time.new(2018,5,31, 11,00,00, "+00:00"),
    #'wp4' =>       Time.new(2018,6,5,  11,00,00, "+00:00"),
    #'wp5' =>       Time.new(2018,6,7,  11,00,00, "+00:00"),
    #'wp7' =>       Time.new(2018,6,12, 11,00,00, "+00:00"),
    #'wp8' =>       Time.new(2018,6,14, 11,00,00, "+00:00"),
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

    output = "The time #{beforeafter} **NA #{waypoint}** is: **#{time}**\n"
    
    if curr_time < jumpna[waypoint.downcase]
      timenaj = Time.diff(jumpna[waypoint.downcase], Time.now.utc)[:diff]
      output += "The time before **NA** Jump is: **#{timenaj}**\n\n"
    end

    if waypointseu[waypoint.downcase]
      if curr_time < waypointseu[waypoint.downcase]
        timeeu = Time.diff(waypointseu[waypoint.downcase], Time.now.utc)[:diff]
        output += "The time before **EU** meeting is: **#{timeeu}**\n"
      end
      if curr_time < jumpeu[waypoint.downcase]
        timeeuj = Time.diff(jumpeu[waypoint.downcase], Time.now.utc)[:diff]
        output += "The time before **EU** jump is: **#{timeeuj}**\n\n"
      end
    end

    if waypointsaus[waypoint.downcase]
      if curr_time < waypointsaus[waypoint.downcase]
        timeaus = Time.diff(waypointsaus[waypoint.downcase], Time.now.utc)[:diff]
        output += "The time before **AUS** meeting is: **#{timeaus}**\n"
      end
      if curr_time < jumpaus[waypoint.downcase]
        timeausj = Time.diff(jumpaus[waypoint.downcase], Time.now.utc)[:diff]
        output += "The time before **AUS** jump is: **#{timeausj}**"
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
