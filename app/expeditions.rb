require 'rest-client'
require 'json'

module Expeditions
  extend Discordrb::Commands::CommandContainer

  command :regnum, description: 'Get a user\'s registration number for a given expedition', usage: "<expedition id> <user>", min_args: 2, max_args: 2 do |event, expedition_id, user_id|
    registrations = JSON.parse(RestClient.get("https://api.smallworlds.io/api/expeditions/#{expedition_id}/registrations/", {accept: :json}).body)

    if registrations.empty?
      event.respond 'No registrations found for that expedition'
      break
    end

    puts registrations

    reg_user = registrations.find { |registration| registration['user'] == user_id.to_i }

    puts reg_user

    if reg_user.nil?
      event.respond 'No registration found for that user'
      break
    end

    "That user has registration number: **#{reg_user['registration_number']}**"
  end
end
