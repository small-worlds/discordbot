module Listing
  extend Discordrb::Commands::CommandContainer

  wing_list = Array.new
  # The array that is wing_list is created.
  
  wing_switch = true
  # So we can turn &wingme on and off

  command :winglist, required_roles: [234099430897221632], description: "Lists those who are requesting wing." do |event|
    # Check to see if they have the "wingcaptain" role. Won't work for anyone else.
    # Simple, return the array's contents.
    if wing_list.empty?
      event.respond "No one is currently in the wing."
    else
      event.respond "\n" + wing_list.join("\n")
      # Why do I have the feeling this will barf data unintelligibly?
    end
  end

  command :wingremove, required_roles: [314411525513150464], description: "Remove a person from the wing queue", min_args: 1, max_args: 1 do |event, target|
  # Remove someone who is on the wing list. Needs admin role.
    wing_list.delete(target)
    event.respond "Removed #{target} from the queue."
  end

  command :wingnuke, required_roles: [314411525513150464], description: "Removes everything from the wing list. Useful for after a meetup." do |event|
  # Removes everyone from the wing list. Needs admin role.
    wing_list.clear
    # will this actually work? I think no, but it seems to for now.
    event.respond "As requested, the list has been nuked."
  end

  command :wingme, description: "Adds you to the wing queue" do |event|
  # Adds the person who used the command to wing_list.
    if wing_switch == false
    # Turns the command on and off
      event.respond "Not currently accepting wing invites"
      break
    else
      break if event.channel.name.downcase != 'bot-abuse'
      # Forces people to only use bot-abuse for wing requests.
      if wing_list.include?(event.user.name)
      # Check the user isn't spamming their name onto the list...
        event.respond "You're already on this list! Be patient!"
        # ...and tell them off for it.
      else
        wing_list << event.user.name
        # Find the user who typed &WingMe and add them to the array-list.
        event.respond "Added to the Wing request queue."
      end
    end
  end

  command :wingnext, required_roles: [234099430897221632], description: "Displays the next in line, and tags them so they know about it. Also kicks them from the line." do |event|
  # prints top line of the text file, then removes it. Essentially shouting "Next"
      # Save first value to tag_me
      tag_me = wing_list.shift
      if tag_me.nil?
        event.respond "There is currently no queue."
      end

      # Find the member object associated with the member. We could probably do this more gracefully.
      event.server.members.each do |member|
        next unless member.username == tag_me
        tag_me = member
        break
      end

      wing_list.uniq!
      event.respond "#{tag_me.mention} needs a wing."
    end
  
  command :wingswitch, required_roles: [314411525513150464] do |event|
    event.respond "Bot accepting &wingme?"
    wing_switch = !wing_switch
  end
end
