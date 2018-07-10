require 'titleize'

module PublicRoles
  extend Discordrb::Commands::CommandContainer

  # Assuming case-sensitive, case-matched to Discord roles
  public_roles = [
    'Roleplayers',
    'Flight Club',
    'Xbox',
    'PS4'
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
end
