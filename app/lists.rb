module Listing
  extend Discordrb::Commands::CommandContainer
	
  wing_list = Array.new
  #The array that is wing_list is created.
	
#  def self.find_role(event, role)
#    has_role = false
#    event.server.roles.each do |server_role|
#      next unless %w(botadmin wingcaptain).any?(server_role.name)
#      has_role = true
#    end
#    return role
#  end

  def self.role?(event, role)
    has_role = false
    event.server.roles.each do |server_role|
      next unless server_role.name == role
      has_role = true
      break
    end
    return has_role
  end
	
  command :winglist, description: "Lists those who are requesting wing." do |event|
  #Simple, return the array's contents. Also, admin lock this.
    break unless event.user.role?(find_role(event, 'wingcaptain'))
    #Check to see if they have the "wingcaptain role"
    event.respond wing_list.join("\n")
	#Why do I have the feeling this will barf data unintelligibly?
  end
  
  command :wingremove, description: "Remove a person from the wing queue", min_args: 1, max_args: 1 do |event, target|
  #Remove someone who is on the wing list. Defo admin lock.
    break unless event.user.role?(event, 'wingcaptain')
	#Check to see if they have the "wingcaptain role". I am aware this is a double comment.
	wing_list.delete(target)
	event.respond "Removed #{target} from the queue."
  end
  
  command :wingnuke, description: "Removes everything from the wing list. Useful for after a meetup." do |event|
    break unless event.user.role?(event, 'wingcaptain') || role?(event, 'botadmin')
	#Check to see if they have the "wingcaptain" role AND "botadmin" role. Probably won't work.
	  wing_list.clear
	  #will this actually work? I think no, but i can't think of a better way.
	  event.respond "As requested, the list has been nuked."
    end

  command :wingme, description: "Adds you to the wing queue" do |event|
  #Adds the person who used the command to wing_list.
    break if event.channel.name.downcase == 'freetalk'
	# Forces people to not use freetalk for wing requests.
    if wing_list.include?(event.user.name)
    #Check the user isn't spamming their name onto the list.
      event.respond "You're already on this list! Be patient!"
      #'and tell them off for it.
    else
      wing_list << event.user.name 
      #Find the user who typed &WingMe and add them to the array-list.
      event.respond "Added to the Wing request queue."
    end
  end
  
  command :wingnext, description: "Displays the next in line, and tags them so they know about it. Also kicks them from the line." do |event|
  #prints top line of the text file, then removes it. Essentially shouting "Next"
    tag_me = wing_list.shift
    #Save first value to tag_me
    wing_list.uniq!
    #Prints first value, then wipes from wing_list
    event.respond "@#{tag_me} needs a wing."
  end
end
