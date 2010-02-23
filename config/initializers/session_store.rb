# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_my_google_forms_session',
  :secret      => '376fcffcaa6c17bdd14f6856f90d4c423f381187cf22cc390aeaae5861933f498783f044f4b664ad901e97e07ef4daa2babbd16130298d035f2e057e580d72a6'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
