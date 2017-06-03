require 'json'

# TODO: use a Real™ database.

module Deaths
  extend Discordrb::Commands::CommandContainer

  # looks for the `Operators` role.
  # TODO: move required role to config.
  command :adddeath, required_roles: [314411525513150464], help_available: false do |event, *parse_string|
    parse_string = parse_string.join(' ')
    parse_string = parse_string.split('-', 2)
    name = parse_string[0].gsub(/\s+$/, '')
    reason = parse_string[1].chomp.gsub!(/^\s+/, '')
    previous_deaths = File.read('resources/alldeaths.json')
    all_deaths = JSON.parse(previous_deaths)

    file = File.read('resources/lastdeath.json')
    data_hash = JSON.parse(file)
    count = data_hash['count'] + 1
    time = Time.now.utc

    all_deaths[time] = {
      name: name,
      reason: reason
    }

    temp_hash = {
      name: name,
      reason: reason,
      timestamp: time,
      count: count
    }

    File.open('resources/lastdeath.json', 'w+') do |f|
      f.write(temp_hash.to_json)
    end

    File.open('resources/alldeaths.json', 'w+') do |f|
      f.write(all_deaths.to_json)
    end

    "Womp womp. #{name} died at #{time} - #{reason}. New count: #{count}"
  end

  command :deathcount, description: "Death Count" do |event|
    file = File.read('resources/lastdeath.json')
    data_hash = JSON.parse(file)
    last_death = Time.parse(data_hash["timestamp"])

    diff = Time.diff(last_death, Time.now.utc)

    name = data_hash["name"]
    death = data_hash["reason"]
    count = data_hash["count"]

    event << "SWE2 Death Count: **#{count}**"
    event << "We have gone #{diff[:diff]} without an accident."
    event << "Most recent death: **#{name}** - #{death}"
  end
end
