module BearingPlotter
  extend Discordrb::Commands::CommandContainer

  command :bearing, description: "Import of http://edbearingcalc.neocities.org, for your ease of use. Gives you a heading to fly on, once you give where you are and where you want to be. X co-ord is the top number, Y is the middle number. (gravity is the bottom number).", usage: "<Your position's X> <Your position's Y> <Destination's X> <Destination's Y>", min_args: 4, max_args: 4 do |event, x_start, y_start, x_end, y_end|
    delta_x = x_start - x_end #dX for the tan calculation
    delta_y = y_start - y_end #dY for the tan calculation
    heading = (Math.atan2(delta_y, delta_y) * (180/Math::PI)) #Takes dX and dY, runs them through tan, and then makes them into Deg (from radians)
    heading = 360 + heading if heading <= 0
    event.respond "Fly on heading #{heading.round(0)}"
  end
end
