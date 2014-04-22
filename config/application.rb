require File.expand_path('../boot', __FILE__)

Bundler.require(:default, :assets, ENV['RACK_ENV'])
require 'redis'

REDIS = Redis.new(:host => "127.0.0.1", :port => 6379, :db => 0)

[
  './app/{presenters,models,helpers,controllers}/**/*.rb',
  './{lib,api}/**/*.rb'
].each{ |path| Dir.glob(path, &method(:require)) }

