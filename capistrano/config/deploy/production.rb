set :stage, :production
set :branch, 'master'
server 'vladimirmarkin.com', user: fetch(:user), roles: %w{web db app}
