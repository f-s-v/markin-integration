lock '3.2.1'

set :application, 'markin'
set :repo_url, 'git@github.com:f-s-v/markin-application.git'
set :user, :web
set :deploy_to, "/home/#{fetch(:user)}/applications/#{fetch(:application)}"
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets vendor/bower}
set :linked_files, %w{.env}
set :ssh_options, { forward_agent: true }
set :secrets_app_name, 'f-s-v-secrets'
set :secrets_app_pattern, 'MARKIN'
set :services, [
  {name: fetch(:application), roles: :app, sudo: true}
]
