# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_tracks-2_session',
  :secret      => '208785ed3223e515567d9613f22933a1311bdc4cee12711ac66bff3a067d6c26d81ecdedc12d1a0bd68d78578c3482e53fb0dd9bc493eb8ec0389bbea1717397'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
