set :stage, :production
set :branch, 'master'
server 'vm.dev.f-s-v.com', user: fetch(:user), roles: %w{web db app}
