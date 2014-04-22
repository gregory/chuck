module Presenters
  module Logs
    class Deploy
      def self.server_url(redis_key)
        developer = redis_key.gsub("chuck:servers:", "")
        "http://#{developer}.leasearsocial.com"
      end

      def self.github_url(branch_name)
        "https://github.com/LeaseStar/RMO/compare/master...#{branch_name}"
      end

      def self.commit_url(sha)
        "https://github.com/LeaseStar/RMO/commit/#{sha}"
      end
    end
  end
end
