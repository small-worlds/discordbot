module NoContext
  extend Discordrb::Commands::CommandContainer

  command :nocontext, description: "No context. None.", bucket: :memes do |event|
    f = File.open('resources/quotes.txt')
    contents = f.readlines
    contents.sample
  end
end
