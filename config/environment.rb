require 'bundler'
Bundler.require

# Get the path of the root of our project
APP_ROOT = File.expand_path("..", __dir__)

# Require the controller(s)
Dir.glob(File.join(APP_ROOT, 'app', 'controllers', '*.rb')).each {|file| require file}

# Require the model(s)
Dir.glob(File.join(APP_ROOT, 'app', 'models', '*.rb')).each {|file| require file}


class TaskManagerApp < Sinatra::Base
  set :root, APP_ROOT
  set :method_override, true
  set :views, File.join(APP_ROOT, 'app', 'views')
  set :public_folder, File.join(APP_ROOT, 'app', 'public')
end
