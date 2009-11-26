# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_amazon_watch_session',
  :secret      => '79692f6eb45d634679ef831aa3a6aac27693f4a9071ad14282143a53d80343674b0beb7c2b989d8d8716fd18846764906a24ddf251be9562b88551ee819900bb'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
