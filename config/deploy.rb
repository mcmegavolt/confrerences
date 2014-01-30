# config valid only for Capistrano 3.1
lock '3.1.0'

set :deploy_to, "/home/conferences/conferences"
set :scm, :git
set :deploy_via, :remote_cache
set :repo_url, 'git@github.com:mcmegavolt/conferences.git'
set :copy_exclude, [".git"]
set :branch, 'develop'
set :format, :pretty
set :log_level, :debug
set :pty, true

set :rvm_type, :user
set :rvm_ruby_version, '2.0.0-p353'

# set :linked_files, %w{config/database.yml}

set :linked_dirs, %w{public/uploads}

# set :default_env, { path: "/opt/ruby/bin:$PATH" }
set :keep_releases, 5

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      # execute :touch, release_path.join('tmp/restart.txt')
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