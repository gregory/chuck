class StoriesController < ApplicationController
  get '/' do
    @deploys = Logs::Deploy.all
    slim :index
  end
end
