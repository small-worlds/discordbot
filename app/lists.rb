module Listing
	extend Discordrb::Commands::CommandContainer
	
	wing_list = Array.new
	#The array that is wing_list is created.
	
	command :winglist, description: "Lists those who are requesting wing." do |event|
	#Simple, return the array's contents. Also, admin lock this.
		
	end
  
	command :wingremove, description: "Remove a person from the wing queue", min_args: 1, max_args: 1 do |event, target|
	#Remove someone who is on the wing list. Defo admin lock.
		
	end

	command :wingme, description: "Need a wing? &WingMe" do |event|
	#Adds the person who used the command to wing_list.
		wing_list.push(event.user.name)
		#Find the user who typed &WingMe and add them to the array-list
		event.respond "Added to the Wing request queue."
	end
  
	command :wingnext, description: "???" do |event|
	#prints top line of the text file, then removes it. Essentially shouting "Next"
		tag_me = wing_list[0]
		#Save first value to tag_me
		wing_list.uniq
		#Prints first value, then wipes from wing_list
		event.respond wing_list.shift + " needs a wing"
		event.respond "@#{tag_me}, Wing request sent."
	end
end