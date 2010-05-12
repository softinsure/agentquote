# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_agentquote_session',
  :secret      => '9f6a9433d44ef429eb9cef2e514e3974f9e45665e9f8f06761c06a06b3211612771230bb79bf60e38e80d2a8f3c49df9e25cbabbebda9dd8173dc57fa4192983'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
