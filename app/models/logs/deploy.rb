module Logs
  class Deploy
    attr_reader :branch, :datetime, :sha, :diff_master

    def initialize(argsH)
      @branch      = argsH.fetch("branch")
      @datetime    = argsH.fetch("datetime")
      @sha         = argsH.fetch("sha")
      @diff_master = argsH.fetch("diff_master")
    end

    def self.new_from_json(data)
      data = JSON.parse(data)
      self.new(data)
    end

    def self.all
      keys = REDIS.keys "chuck:servers:*"
      keys.each_with_object({}){ |key, h| h[key] = self.find(key) }
    end

    def self.find(key)
      data = REDIS.get key
      self.new_from_json data
    end
  end
end
