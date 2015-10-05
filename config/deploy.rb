# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'my_app_name'
set :repo_url, 'git@github.com:djeiky/evpn.git'

set :deploy_user, 'zhenya'
# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp
set :branch, fetch(:branch, 'rewrite')

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '/var/www/vhosts/e-vpn.ru/httpdocs'

# Default value for :scm is :git
set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
set :pty, true

# Default value for :linked_files is []
set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')

# Default value for linked_dirs is []
set :linked_dirs, fetch(:linked_dirs, []).push('public', 'vendor/bundle')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
set :keep_releases, 3

set :deploy_via, :remote_cache
set :ssh_options, :forward_agent => true

namespace :bundle do
    desc 'Run bundle'
    task :install do
	on roles(:app) do
	    execute :mkdir, '-p', release_path.join('vendor/bundle')
	    execute "cd #{release_path} && bundle install vendor/bundle"
	end
    end
end



namespace :deploy do

    desc 'Restart application'
    task :restart do
	on roles(:app), in: :sequence, wait: 5 do
	    execute :mkdir, '-p', release_path.join('tmp')
	    execute :touch, release_path.join('tmp/restart.txt') 
	end
    end
    after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end
