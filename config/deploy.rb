set :application, "jetting_penguin"
set :repository, "git@github.com:penguinoh/#{application}"

set :scm, :git
set :branch, "master"
set :scm_verbose, true
set :ssh_options, {:forward_agent => true}
ssh_options[:port] = 2234

set :user, "apps"
set :use_sudo, false
set :deploy_to, "/var/www/jettingpenguin.com"
set :main_server, "jettingpenguin.com"

role :web, main_server
role :app, main_server
role :db, main_server, :primary => true

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{File.join(current_path, "tmp", "restart.txt")}"
  end
end

