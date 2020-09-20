module Magiclink
  class Client
    class << self
      attr_accessor :configuration
    end

    def self.configure
      self.configuration ||= Configuration.new
      yield self.configuration
    end

    class Configuration
      attr_accessor :secret_key

      def initialize
        self.secret_key = ''
      end
    end
  end
end
