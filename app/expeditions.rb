require 'rest-client'
require 'json'

module Expeditions
  extend Discordrb::Commands::CommandContainer

  command :registrations, description: 'Get a list of all registrations, optionally for a given expedition', usage: '[<expedition id>]', min_args: 0, max_args: 1 do |event, expedition_id|
    expedition_id ||= 1 # The current expedition.
    message = ['Current registrations:']

    registrations = JSON.parse(RestClient.get("https://api.smallworlds.io/api/expeditions/#{expedition_id}/registrations/", {accept: :json}).body)

    event.respond "Sending you a PM!"

    registrations.each do |registration|
      username = JSON.parse(RestClient.get("https://api.smallworlds.io/api/users/#{registration['user']}", {accept: :json}).body)['username']
      message.push "#{registration['registration_number'].to_s.rjust(3, '0')}: #{username} - #{registration['ship_model']}"
      message[-1] = "#{message[-1]}, *#{registration['ship_name']}*" unless registration['ship_name'] == ''
    end

    event.user.pm(message.join("\n"))
  end

  command :regnum, description: 'Get a user\'s registration number, optionally for a given expedition', usage: "<username> [<expedition id>]", min_args: 1, max_args: 2 do |event, username, expedition_id|
    expedition_id ||= 1 # The current expedition.
    user_object = JSON.parse(RestClient.get("https://api.smallworlds.io/api/users/", {accept: :json}).body)

    user = user_object.find { |obj| obj['username'].downcase == username.downcase }

    if user.nil?
      event.respond "No user found with username #{username}"
      break
    end

    registrations = JSON.parse(RestClient.get("https://api.smallworlds.io/api/expeditions/#{expedition_id}/registrations/", {accept: :json}).body)

    if registrations.empty?
      event.respond "No registrations found for expedition #{expedition_id}"
      break
    end

    reg_user = registrations.find { |registration| registration['user'] == user['id'] }

    if reg_user.nil?
      event.respond "No registration found for #{username}"
      break
    end

    "#{username}'s registration numer for expedition #{expedition_id}: **#{reg_user['registration_number'].to_s.rjust(3, "0")}**"
  end
end
