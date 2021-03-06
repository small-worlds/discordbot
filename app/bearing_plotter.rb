module BearingPlotter
  extend Discordrb::Commands::CommandContainer

  command :bearing, description: "Import of http://edbearingcalc.neocities.org, " \
                      "for your ease of use. Gives you a heading to fly on, once you give " \
                      "where you are and where you want to be. " \
                      "X co-ord is the top number, Y is the middle number. " \
                      "(gravity is the bottom number).",
                    usage: "<Your position's X> <Your position's Y> <Destination's X> <Destination's Y>",
                    min_args: 4, max_args: 4 do |event, x_start, y_start, x_end, y_end|
    # dX for the tan calculation
    delta_x = x_end.to_f - x_start.to_f

    #dY for the tan calculation
    delta_y = y_end.to_f - y_start.to_f

    # Takes dX and dY, runs them through tan, and then makes them into Deg (from radians)
    heading = (Math.atan2(delta_y, delta_x) * (180/Math::PI))
    heading = 360 + heading if heading < 0

    event.respond "Fly on heading #{heading.round(0)}"
  end
end
