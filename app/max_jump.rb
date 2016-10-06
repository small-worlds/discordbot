# x=((1000^(1/c))×o×(f/r)^(1/c))/m
# X is max distance.
# C is a Class constant
# O is the Optimised mass
# F is max Fuel per jump
# R is a Rating constant
# M is your total mass

module MaxJumpCalculator
  extend Discordrb::Commands::CommandContainer

  command :maxjump, description: "Calculate your max jump range", usage: "<class> <rating> <max_fuel_per_jump> <mass> <optimized_mass>", min_args: 5, max_args: 5 do |event, class_arg, rating, max_fuel, mass, optimized_mass|
    unless (class_arg.to_i.between?(2, 8) && rating.upcase =~ /[A-E]/ && max_fuel.to_f && mass.to_f && optimized_mass.to_f)
      event.respond "Invalid argument provided!"
      break
    end

    rating_constant = {
      "A" => 12,
      "B" => 10,
      "C" => 8,
      "D" => 10,
      "E" => 11
    }

    class_constant = {
      "2" => 2.00,
      "3" => 2.15,
      "4" => 2.30,
      "5" => 2.45,
      "6" => 2.60,
      "7" => 2.75,
      "8" => 2.90
    }

    max_distance = ((1000**(1/class_constant[class_arg])) * optimized_mass.to_f * (max_fuel.to_f/rating_constant[rating.upcase])**(1/class_constant[class_arg]))/mass.to_f
    event.respond "#{max_distance.round(2)}"
  end
end
