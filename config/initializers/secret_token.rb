# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.

# This change is here to wipe the session everytime the server is started.
# This makes it easier to develop because the database can be wiped while
# the developer is still logged in. A different secret is used in production
# to protect the user's oauth tokens
TweetClock::Application.config.secret_token = Time.now.to_i.to_s * 10
