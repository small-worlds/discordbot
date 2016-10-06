require 'titleize'

module PublicRoles
  extend Discordrb::Commands::CommandContainer

  # Assuming case-sensitive, case-matched to Discord roles
  public_roles = [
    'Small Worlders',
    'Xbox Small Worlders',
    'Roleplayers'
  ]

  command :role, description: "Add or remove a public role on yourself", usage: "role <rolename>\nAvailable roles:\n- #{public_roles.join("\n- ")}" do |event, *role_name|
    role = role_name.join(' ').downcase.titleize

    if public_roles.include?(role)
      event.server.roles.each do |server_role|
        next unless server_role.name == role
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
end

module PublicRolesEvents
  extend Discordrb::EventContainer

  member_join do |event|
    role = nil
    event.server.roles.each do |server_role|
      next unless server_role.name == 'Small Worlders'
      role = server_role
      break
    end
    puts "DEBUG: #{role.inspect}"
    event.user.add_role(role) unless event.roles.include?(role)
  end
end
