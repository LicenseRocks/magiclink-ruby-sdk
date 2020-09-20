require 'faraday'

module Magiclink
  class Api
    def self.instance
      @instance ||= new
    end

    def logout_by_issuer(issuer)
      connection.post('/v2/admin/auth/user/logout', { issuer: issuer }.to_json)
    end

    def get_metadata_by_issuer(issuer)
      connection.get('/v1/admin/auth/user/get', { issuer: issuer })
    end

    private

    attr_reader :connection

    def initialize
      @connection = Faraday.new(
        url: 'https://api.magic.link',
        headers: {
          'Content-Type': 'application/json',
          'X-Magic-Secret-Key': Client.configuration.secret_key
        }
      )
    end
  end
end
