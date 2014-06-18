# Sinatra quick and dirty app to track where you've deployed your branches

Here is what you should add to your deploy.rb

    before "deploy",              "log:deploy"

    require 'redis'
    require 'json'

    REDIS = Redis.new(host: "localhost", port: 6379, db: 0)

    namespace :log do
      desc "Log the deploy"
      task :deploy do
        branch_name = ``git rev-parse --abbrev-ref HEAD``.strip
        json_format ='{%C(yellow)"sha":"%h", %C(red)"author":"%an", %C(green)"time":"%cr", %Creset"subject":"%s"}'
        diff_master = `git log --pretty=format:'#{json_format}' release..#{branch_name}`.gsub(/\e\[[0-9]{0,2}m*/, '').split(/\n/)
        developer   = ``git config user.name``.strip

        data = {
          branch: branch_name,
          datetime: DateTime.now,
          sha: `git rev-parse HEAD`.strip,
          diff_master: diff_master
        }
        REDIS.set "chuck:servers:#{developer}", data.to_json
      end
    end

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
