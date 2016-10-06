module Roleplay
  extend Discordrb::Commands::CommandContainer

  birth = [
    "a Slave",
    "Low-Class",
    "Middle-Class",
    "High-Class"
  ]

  upbringing = [
    "Slave",
    "Merchant",
    "Miner",
    "Pirate",
    "Potential Politician",
    "Laborer",
    "Linguist",
    "Explorer",
    "Smuggler",
    "Pickpocket",
    "Educator",
    "Entertainer"
  ]

  planet = [
    "Low-Tech",
    "Agricultural",
    "High-Tech",
    "Industrial",
  ]

  station_types = [
    'Orbis Station',
    'Coriolis Station',
    'Ocellus Station',
    'Outpost'
  ]

  faction = [
    'Alliance',
    'Federation',
    'Empire',
    'Independant'
  ]

  empire = [
    'Aisling Duval',
    'Zemina Torval',
    'Arissa Lavigny-Duval',
    'Denton Patreus',
    'no one'
  ]

  alliance = [
    'Edmund Mahon',
    'no one'
  ]

  federation = [
    'Zachary Hudson',
    'Felicia Winters',
    'no one'
  ]

  independant = [
    'Li Yong Rui',
    'Pranav Antal',
    'Archon Delaine',
    'no one'
  ]

  engineers = [
    "Elvira Martuuk",
    "The Dweller",
    "Liz Ryder",
    "Felicity Farseer",
    "Tod 'The Blaster' McQuinn",
    "Zacariah Nemo",
    "Lei Chung",
    "Hera Tani",
    "Juri Ishmaak",
    "Selene Jean",
    "Marco Qwent",
    "Professor Palin",
    "Broo Tarquin",
    "Colonel Bris Dekker",
    "Didi Vatermann"
  ]

  job = [
    "Captain",
    "Cadet",
    "First Mate",
    "Pilot",
    "Helmsman",
    "Co-pilot",
    "Navigation Officer",
    "Communications Officer",
    "Gunner/Weapons Officer",
    "Ship's Mechanic",
    'Engineer',
    "Medical Officer/Doctor",
    "Science Officer",
    "Cargo Handler/Quartermaster",
    "SRV Pilot",
    "Ship's Cook",
    "Fighter Escort",
    "Boatswain's Mate",
    "Laborer",
    "Scout",
    "Translator",
    "Engineer",
    "Ship Designer",
    "Shipyard Supervisor",
    "Cannon Technician",
    "Explorer",
    "Air Traffic Controller",
    "Clerk",
    "Custodial Engineer",
    "HVAC Technician",
    "Smuggler",
    "Arms Dealer",
    "Gun Runner",
    "Money Launderer",
    "Mafioso",
    "Programmer",
    "Hacker",
    "Apprentice to #{engineers.sample}",
    "Educator",
    "Entertainer",
    "Security",
    "Defense Contractor",
    "Orbital Station Manager"
  ]

  ship_descriptors = {
    'exploration' => [
      'Wandering',
      'Absent-Minded',
      'Analytical',
      'Examiner',
      'Roaming',
      'Travelling',
      'Gypsy',
      'Recon',
      'Touring',
      'Restless'
    ],
    'research' => [
      'Analytical',
      'Inquiring',
      'Investigating',
      'Probing',
      'Experimental',
      'Delver',
      'Inquest',
      'Fact-Finding',
      'R&D',
      'Fishing'
    ],
    'combat' => [
      'Conflict',
      'Engaging',
      'Fray',
      'Warship',
      'Runabout',
      'Jackpot',
      'Fighting',
      'Smoking'
    ],
    'trade' => [
      'Lucky',
      'Frugal',
      'Miserly',
      'Prudent',
      'Supervisor',
      'Careful',
      'Austere'
    ],
    'pirate' => [
      'Blackbeard\'s',
      'Arghworthy',
      'Dark',
      'Corsair',
      'Marauding',
      'Roving',
      'Ravaging',
      'Despotic'
    ],
    'smuggler' => [
      'Stealthy',
      'Crafty',
      'Clandestine',
      'Silent',
      'Slinking',
      'Sly',
      'Underhanded',
      'Undercover',
      'Skulking'
    ],
    'miner' => [
      'Drillship',
      'Burrowing',
      'Scooping',
      'Tunneling',
      'Prospecting',
      'Anticipating',
      'Calculating'

    ],
    'transport' => [
      'Passagemaking',
      'Transport',
      'Portage',
      'Swift',
      'Feline'
    ],
    'rescue' => [
      'Salvaging',
      'Liberating',
      'Reclaiming',
      'Redempting',
      'Ransom',
      'Technical Support'
    ],
    'stellar' => [
      'Quasar',
      'Pulsar',
      'Magnetar',
      'Neutron',
      'Star',
      'Singularity',
      'Rift',
      'Expanse',
      'Nebula',
      'Galaxy'
    ],
    'animal' => [
      'Ocelot',
      'Jaguar',
      'Elephant',
      'Lion',
      'Bumblebee',
      'Cheetah',
      'Dog',
      'Leopard',
      'Cat',
      'Tiger',
      'Beluga',
      'Orca',
      'Dolphin',
      'Narwhal',
      'Manatee',
      'Moth',
      'Rabbit',
      'Hare',
      'Unicorn',
      'Jackalope',
      'Horse',
      'Stallion',
      'Pony',
      'Snake',
      'Spider',
      'Mouse',
      'Rat',
      'Monkey',
      'Scorpion',
      'Sunfish',
      'Spacecow'
    ],
    'verb' => [
      'Carrier',
      'Messenger',
      'Runner',
      'Drogher',
      'Bearer',
      'Scout',
      'Transporter',
      'Candidate',
      'Successor',
      'Suitor',
      'Jogger',
      'Driver',
      'Apparition',
      'Courier',
      'Trader',
      'Explorer',
      'Miner',
      'Smuggler',
      'Ranger'
    ],
    'name' => [
      'Zachary Hudson',
      'Mars',
      'Zeus',
      'Aisling Duval',
      'Hengist Duval',
      'Anders Blaine',
      'Brendan Paul Darius',
      'Felicia Winters',
      'Daddy Jerek'
    ],
    'food' => [
      'Carrot',
      'Lychee',
      'Macaroni',
      'Cheese',
      'Cereal',
      'Bagel',
      'Donut',
      'Haggis',
      'Spinach',
      'Tomato',
      'Strawberry',
      'Grape',
      'Banana',
      'Apple',
      'Peach',
      'Lutefisk',
      'Surströmming',
      'Rhubarb',
      'Taco'
    ]
  }

  command(:shipname, min_args: 0, max_args: 2, description: 'Generates a list of random ship names, with optional parameters.', usage: "shipname [descriptor] [descriptor]\nAvailable descriptors are:\n- #{ship_descriptors.keys.join("\n- ")}") do |event, descriptor1, descriptor2|
    descriptor1.downcase! if descriptor1
    descriptor2.downcase! if descriptor2

    unless ship_descriptors.has_key?(descriptor1) && ship_descriptors.has_key?(descriptor2)
      if descriptor2.nil? && ship_descriptors.has_key?(descriptor1)
        if [true,false].sample
          descriptor2 = descriptor1
          descriptor1 = ship_descriptors.keys.sample
        else
          descriptor2 = ship_descriptors.keys.sample
        end
      elsif !ship_descriptors.has_key?(descriptor1) && ship_descriptors.has_key?(descriptor2)
        if [true,false].sample
          descriptor1 = descriptor2
          descriptor2 = ship_descriptors.keys.sample
        else
          descriptor1 = ship_descriptors.keys.sample
        end
      else
        descriptor1 = ship_descriptors.keys.sample
        descriptor2 = ship_descriptors.keys.sample
      end
    end

    descriptor = ship_descriptors[descriptor1].sample
    noun = ship_descriptors[descriptor2].sample
    noun.gsub!(/ing$/, 'er') unless noun == 'Surströmming'
    noun.gsub!(/'s/, '')
    "The #{descriptor} #{noun}"
  end

  command(:chargen, description: 'Generate a character concept') do |event|
    born = birth.sample
    raised = upbringing.sample
    born_on = planet.sample
    [true, false].sample ? born_on += " #{station_types.sample}" : born_on += " world"
    position = job.sample
    aligned = faction.sample
    if (aligned == 'Empire')
      power = empire.sample
    elsif (aligned == 'Alliance')
      power = alliance.sample
    elsif (aligned == 'Federation')
      power = federation.sample
    else
      power = independant.sample
    end

    if (rand(1000) == 42)
      born = 'a Peach'
      raised = 'Peach Tree'
      born_on = 'Agricultural world'
      aligned = 'Agricultural Laborers Union'
      power = 'Agricultural Laborers Union CEO'
    end

    event << "You were born *#{born}* on a *#{born_on}*, and brought up as a *#{raised}*."
    event << "You are now aligned *#{aligned}*."
    power == 'no one' ? event << "You are unaligned to a power." : event << "You are aligned to *#{power}*."
    event << "You are now a *#{position}*."
  end
end
