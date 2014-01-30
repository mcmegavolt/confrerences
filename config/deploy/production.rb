set :stage, :production

server 'sametut.org', user: 'conference', roles: %w{web app db},
  ssh_options: {
    # keys: %w(/home/user_name/.ssh/id_rsa),
    forward_agent: false,
    auth_methods: %w(password), # %w(publickey password)
    password: 'C0NfEreNcEpa8Sw0rd'
  }

fetch(:default_env).merge!(rails_env: :production)