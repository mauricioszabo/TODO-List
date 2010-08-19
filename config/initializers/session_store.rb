# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_todo_list_session',
  :secret      => '061e583a1e3fc2ac9b40d7165b866e8e16da24e8baba278fe2e47298d563002ce1869dcd2fddc894aa33e31fc91c6099b7d9687b09d0b3aaa7773fe875400cc3'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
