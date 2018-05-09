require 'zalgo'

module CustomCommands
  extend Discordrb::Commands::CommandContainer

  memes = {
    aaaa: [
      "https://cdn.discordapp.com/attachments/363726157310328833/369951053703151626/aaaaaaaaaaaaa.jpg",
      "https://cdn.discordapp.com/attachments/363726157310328833/369955470531624970/20170901_173400.jpg"
    ],
    ayy: "https://cdn.drawception.com/images/panels/2015/6-16/xQfqepw73p-2.png",
    banned: "http://i.imgur.com/O3DHIA5.gif",
    braben: [
      "https://cdn.discordapp.com/attachments/197446400479330304/218859855773958145/Thargoid.jpg",
      "https://cdn.discordapp.com/attachments/192085854116773889/220904177407098880/Brabenisthargoid.png"
    ],
    esspace: "https://cdn.discordapp.com/attachments/143948895595003904/218099450239909888/IMG_0217.JPG",
    fangirling: "http://i.imgur.com/GBgz12Q.gif",
    gofast: "https://41.media.tumblr.com/tumblr_ma86gbciIo1qg1jivo1_1280.png",
    innuendo: "https://cdn.meme.am/instances/500x/18009491.jpg",
    itshappening: "https://giphy.com/gifs/neogaf-ron-sanders-makrD8LE59iJa",
    knife: "http://pngimg.com/upload/spoon_PNG3043.png",
    nobody: "http://i.imgur.com/FMiHqHj.jpg",
    peropq: "https://cdn.discordapp.com/attachments/197446400479330304/218859355821441035/5D3jfaG.png",
    spaaace: "http://i.imgur.com/3wcIwiqb.png",
    spaceelf: "❤❤❤ MY WAIFU ❤❤❤ http://hosting.zaonce.net/elite/newsletters/newsletter_201505_29/AislingDuval.jpg",
    spacetrump: "https://cdn.discordapp.com/attachments/197446400479330304/219322820935680000/Zachary_Hudson.png",
    speedy: "http://i.imgur.com/Q7ppJ3I.png",
    spoon: "http://vignette3.wikia.nocookie.net/unsuper/images/b/b1/The_Tick.jpg/revision/latest?cb=20150415023059",
    starportservices: "http://i.imgur.com/nM8egVC.jpg",
    thargoids: "https://cdn.meme.am/instances/500x/62949872.jpg",
    ytho: "http://i.imgur.com/yNlQWRM.jpg"
  }

  command :meme, description: "Full of dank.", bucket: :memes, usage: "meme [<meme name>]\nAvailable memes:\n- #{memes.keys.join("\n- ")}", min_args: 0, max_args: 1 do |event, meme|
    break if event.channel.name.downcase == "freetalk"
    meme = memes.keys.sample unless meme && memes.key?(meme.downcase.to_sym)

    response = memes[meme.downcase.to_sym]
    response = response.sample if response.kind_of?(Array)
    event.respond response
  end

  command :kgbfoam, description: "To learn about filtering the Galaxy Map" do |event|
    event.respond "To learn about Filtering the Galaxy Map, click here: http://t.fuelr.at/kgbfoam"
  end

  command :zalgo, description: "He comes", bucket: :memes, min_args: 1 do |event, *text|
    msg = text.join(' ')
    event.respond Zalgo.he_comes(msg)
  end

  command :guide, description: "How not to got splat on HWCC" do |event|
#    break if event.channel.name.downcase == "freetalk"
    event << "VirtualAnomaly's guide: https://goo.gl/tTM5ug\n"
    event << "Ravstar52's guide: https://goo.gl/dzUnWm \n"
    event << "Rosander's guide: https://goo.gl/MM6fDS"
  end

  command :code, description: "The github page for this bot's code." do |event|
    event.respond "https://github.com/small-worlds/discordbot"
  end

  command :convert, description: "Converts between Credits and SK units.", min_args: 1, max_args: 1 do |events, input|
    dolphins = input/1300000
    orca = input/1300000 * 0.028
    beluga = input/1300000 * 0.015
    event.respond "That's " << dolphins << " Dolphins, " << " Orcas, or " << beluga << "Belugas."
  end

  command :swe3 do |event|
    event.respond "It's happening!"
  end

  command :summon do |event|
    event.respond "https://youtu.be/_TrQ5pA1azo"
  end

  command :hangin do |event|
    event.respond "https://cdn.discordapp.com/attachments/363726157310328833/367439918500151296/my-hell.png"
  end
end
