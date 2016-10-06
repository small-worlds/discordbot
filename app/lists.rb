module Listing
  extend Discordrb::Commands::CommandContainer
  
  command :WingInitilise, description: "Initilise the array. In case of derps." do |event|
	wing_list = Array.new
  end

  command :WingList, description: "Lists those who are requesting wing." do |event| #Simple, return the text file's contents. May consider making this a array. Also, admin lock this.
    
  end
  
  command :WingRemove, description: "Remove a person from the wing queue", min_args: 1, max_args: 1 do |event| #Remove someone who is on the wing list. Defo admin lock.
	
  end

  command :WingMe, description: "Need a wing? &WingMe" #Adds the person who used the command to the wing list.
	to_wing = user.name # The user who typed &WingMe
	wing_list.push(to_wing) #add them to the array-list
	event.respond "Added to the Wing request queue."
  end
  
  command :WingNext, description: "???" #prints top line of the text file, then removes it. Essentially shouting "Next"
	tag_me = wing_list[0] #Save first value to tag_me
	wing_list.uniq #Prints first value, then wipes from wing_list
	event.respond wing_list.shift + " needs a wing"
	event.respond "@" + tag_me + ", Wing request sent."
  end
end

#command :WingInitilise
#wing_list - wing_list.new
#
#command :WingMe
#to_wing = user.name
#wing_list = wing_list push user.name
#puts "Added to the Wing request queue."
#
#command :WingNext
#tag_me = wing_list[0]
#wing_list.uniq
#puts wing_list.shift
#puts " needs a wing"
#puts "@" + tag_me + ", Wing request sent."