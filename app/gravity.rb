# require 'bigdecimal'
# g = G * M / r^2
# gravity = Gravitational Constant * Mass (kg) / radius (m) ^ 2

module GravityCalculator
  extend Discordrb::Commands::CommandContainer

  command :gravity, description: "Calculate surface gravity of a planet", usage: "<mass in 'earths'> <radius in kilometers>", min_args: 2, max_args: 2 do |event, mass, radius|
    gravitational = 6.673 * (10.0 ** -11)
    earth = 5.97237 * (10.0 ** 24)

    mass_in_kg = mass.to_f * earth
    radius = (radius.to_f / 1000) * (10 ** 6)

    gravity = gravitational * mass_in_kg / (radius ** 2)
    g_force = gravity / (gravitational * earth / (6.371 * (10 ** 6)) ** 2)

    event.respond "#{g_force.round(2)}G"
  end
end
