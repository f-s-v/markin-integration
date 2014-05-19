lock '3.2.1'

set :application, 'markin'
set :repo_url, 'git@github.com:f-s-v/markin-application.git'
set :user, :web
set :deploy_to, "/home/#{fetch(:user)}/applications/#{fetch(:application)}"
set :log_level, :info
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets vendor/bower}
set :linked_files, %w{.env}
set :default_env, { path: "./bin:$PATH" }
set :ssh_options, { forward_agent: true }

set :secrets_app_name, 'f-s-v-secrets'
set :secrets_app_pattern, 'MARKIN'

namespace :secrets do
  desc 'Copy secrets from heroku app to application'
  task 'copy' do
    settings = `heroku config --app #{fetch(:secrets_app_name)} | grep '#{fetch(:secrets_app_pattern)}'`
    on roles :app do
      upload! StringIO.new(settings), shared_path.join('.env')
    end
  end

  desc 'Ensure shared .env file'
  task 'check_dotenv' do
    on roles :app do
      unless test("[ -f #{shared_path.join('.env')} ]")
        invoke("secrets:copy")
      end
    end
  end
end
before "deploy:check", "secrets:check_dotenv"

namespace :deploy do
  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      if test("initctl list | grep #{fetch(:application)}")
        execute "sudo restart #{fetch(:application)}"
      end
    end
  end
end
after :publishing, "deploy:restart"