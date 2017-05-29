require 'titleize'

module PublicRoles
  extend Discordrb::Commands::CommandContainer
  extend Discordrb::EventContainer

  # Assuming case-sensitive, case-matched to Discord roles
  public_roles = [
    'Roleplayers',
    'Small Worlds 2',
    'Small Worlds 2 Xbox'
  ]

  command :role, description: "Add or remove a public role on yourself",
                 usage: "role <rolename>\nAvailable roles:\n- #{public_roles.join("\n- ")}" do |event, *role_name|
    role = role_name.join(' ')

    if public_roles.include?(role)
      event.server.roles.each do |server_role|
        next unless server_role.name.downcase == role.downcase
        role = server_role
        break
      end

      if event.user.role?(role)
        event.user.remove_role(role)
        event.respond "#{role.name} removed."
        break
      else
        event.user.add_role(role)
        event.respond "#{role.name} added."
        break
      end
    else
      event.respond "#{role} is either invalid or private."
      break
    end
  end
  
  bot.reaction_add(emoji: 236127165010280458) do |event|
    dave=nil
    if event.message.id == 316293235700137984
      dave=event.user.on(191725064155168770)
      dave.add_role(308279505091559434)
    end
  end
  
  bot.reaction_add(emoji: 316295019097227264) do |event|
    dave=nil
    if event.message.id == 316293235700137984
      dave=event.user.on(191725064155168770)
      dave.add_role(308593158827278337)
    end
  end
  
  bot.reaction_add(emoji: 316295046704136202) do |event|
    dave=nil
    if event.message.id == 316293235700137984
      dave=event.user.on(191725064155168770)
      dave.add_role(308279505091559434)
    end
  end
end
