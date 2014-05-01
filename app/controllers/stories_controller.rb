class StoriesController < ApplicationController
  get '/' do
    @deploy_presenters = Logs::Deploy.all.map{ |redis_key, deploy| Presenters::Logs::Deploy.new({ redis_key: redis_key, deploy: deploy }) }
    slim :index
  end
end
