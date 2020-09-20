require 'ostruct'
require 'json'

module Magiclink
  class User
    def self.get_metadata_by_issuer(issuer)
      response = Api.instance.get_metadata_by_issuer(issuer)

      return OpenStruct.new JSON.parse(response.body).fetch('data')
    end

    def self.logout_by_issuer(issuer)
      response = Api.instance.logout_by_issuer(issuer)

      return JSON.parse(response.body)
    end
  end
end
