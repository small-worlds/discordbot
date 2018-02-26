#!/bin/sh
# Insert the custom config and assets
ln -s /assets/botconfig.yml botconfig.yml
rm -rf audio/
ln -s /assets/audio/ .
ln -s /assets/resources/* resources/

# run the bot
ruby bot.rb
