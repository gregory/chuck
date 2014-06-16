require File.expand_path('../config/environment', __FILE__)

use StoriesController
use Rack::LiveReload if settings.environment == :development
run ApplicationController
