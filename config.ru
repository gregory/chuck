require File.expand_path('../config/environment', __FILE__)

run Rack::Cascade.new [
  ApplicationController #/
]
