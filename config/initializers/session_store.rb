# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_lumini_session',
  :secret      => '8796ca7358bcb3b71479ff4507e9798d6538f4341cf01bd4115e5243d3b9669d38c708ce1e7a662bb97fc6b6633ca500d19396875d833cfaf84e9f39bd3a3dfa'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
