require File.expand_path('../boot', __FILE__)

Bundler.require(:default, :assets, ENV['RACK_ENV'])
require 'redis'

REDIS = Redis.new(:host => "127.0.0.1", :port => 6379, :db => 0)

[
  './app/presenters/**/*.rb',
  './app/models/**/*.rb',
  './app/helpers/**/*.rb',
  './app/controllers/**/*.rb',
  './{lib,api}/**/*.rb'
].each{ |path| Dir.glob(path).sort.each(&method(:require)) }

