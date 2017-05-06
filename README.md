[![Build Status](https://travis-ci.org/small-worlds/discordbot.svg?branch=master)](https://travis-ci.org/small-worlds/discordbot)

# Discordbot

A [Discord](https://discordapp.com) bot, written in Ruby.

### Requirements:

* ruby 2.3.1 or later
* bundler
* A discord app with a bot added.

### Discord Application Setup

1. Go to your [Discord Developer Applications](https://discordapp.com/developers/applications/me)
2. Add an application named however you want.
3. After creating your application, click on `Create a Bot User` to create a bot for your application.
4. Under App Details, get your `Client ID`.
5. Under App Bot User, click on `click to reveal` to get your Token.

### Bot Setup

1. Clone the repository.
2. Run `bundle install` to install the required gems.
3. Copy `botconfig.yml.example` to `botconfig.yml` and edit it with your Token and Client ID.
4. Run the bot: `ruby bot.rb`.
5. Great success!

When you run the bot, it will give you an invite URL to invite it to your server. Follow that, select your Discord community, and PROFIT!
