module Presenters
  module Logs
    class Deploy
      include Memoizable
      extend Forwardable

      attr_reader :branch, :diff_master, :sha
      def_delegators :@deploy, :branch, :sha, :datetime

      def initialize(argsH)
        @deploy    = argsH.fetch(:deploy)
        @redis_key = argsH.fetch(:redis_key)
      end

      def deploy_time
        @deploy_time ||= DateTime.parse(self.datetime).strftime("%F %I:%M%p")
      end

      def diff_master
        diffs = @deploy.diff_master.map{|diff| JSON.parse(diff) }
        diffs.map{|h| {sha: h['sha'], log: h['subject'], author: h['author'], time: h['time']}}
      rescue
        return []
      end
      memoize :diff_master

      def jira_story
        @jira_story ||= self.branch[/RMO-[0-9]*/, 0]
      end

      def developer
        @developer||= @redis_key.gsub("chuck:servers:", "")
      end

      def github_url
        self.class.github_url(self.branch)
      end

      def server_url
        self.class.server_url(self.developer)
      end

      def jira_url
        self.class.jira_url(self.jira_story)
      end

      def self.server_url(developer)
        "http://#{developer}.rcqrmoappro001.leasestar.local/"
      end

      def self.github_url(branch)
        "https://github.com/LeaseStar/RMO/compare/master...#{branch}"
      end

      def self.commit_url(sha)
        "https://github.com/LeaseStar/RMO/commit/#{sha}"
      end

      def self.jira_url(jira_story)
        "http://jira.realpage.com:8080/browse/#{jira_story}"
      end
    end
  end
end
