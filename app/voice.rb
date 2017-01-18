module Voice
  extend Discordrb::Commands::CommandContainer

  rate_limiter = Discordrb::Commands::SimpleRateLimiter.new
  rate_limiter.bucket :voice_bucket, delay: 3

  voices = %w(
    ytho
    thargoid
    horn
    selfdepricate
    esspace
    jerekchoke
    chokeremix
    choke2
    fest
    timeandspace
    expedition
    differentyears
    imacompress
    areyousure
    spaghetti
    prettygood
    deeznuts
    shiga
    goteem
    whee
    eehw
    decompress
    starportservices
    inception
  )

  command :voice, description: "Send a voice! If none specified, randomize!",
                  usage: "voice [<voice_type>]\nVoice types:\n- #{voices.join("\n- ")}",
                  min_args: 0, max_args: 1 do |event, type|
    break if rate_limiter.rate_limited?(:voice_bucket, event.channel)

    type = voices.sample unless voices.include?(type)

    break unless event.user.voice_channel
    event.bot.voice_connect(event.user.voice_channel)
    puts event.user.voice_channel
    event.voice.play_file(File.path("audio/#{type.downcase}.wav"))
    event.bot.voice(event.server).destroy

    # to avoid sending the return of the voice destroy
    nil
  end
end
