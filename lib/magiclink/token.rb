module Magiclink
  class Token
    attr_reader :claim

    def self.parse!(token)
      validate!(token)
      _, claim = decode!(token)
      new(claim)
    end

    def initialize(claim)
      @claim = claim
    end

    def public_address
      # This can also use regex to parse it.
      return issuer.split(':')[-1]
    end

    def issuer
      return claim['iss']
    end

    private

    @@required_fields = ['iat', 'ext', 'nbf', 'iss', 'sub', 'aud', 'tid', 'add'].freeze

    def self.validate!(token)
      proof, claim = self.decode!(token)
      recovered_public_address = Eth::Utils.public_key_to_address(
      Eth::Key.personal_recover(JSON.dump(claim), proof),
      )

      if recovered_public_address != new(claim).public_address
        raise Exception.new "Signature mismatch between 'proof' and 'claim'."
      end

      current_time = Time.now.to_i

      if current_time > claim['ext']
        raise Exception.new 'Given DID token has expired. Please generate a new one.'
      end

      if current_time < claim['nbf']
        raise Exception.new 'Given DID token cannot be used at this time.'
      end

      true
    end

    def self.decode!(token)
      begin
        decoded_did_token = JSON.parse(Base64.urlsafe_decode64(token))
      rescue Exception
        raise Exception.new 'Malformed DID Token'
      end

      if decoded_did_token.length != 2
        raise Exception.new 'DID Token is malformed'
      end

      proof = decoded_did_token[0]

      begin
        claim = JSON.parse(decoded_did_token[1])
      rescue Exception
        raise Exception.new 'DID Token is malformed'
      end

      self.check_required_fields(claim)

      return proof, claim
    end

    def self.check_required_fields(claim)
      missing_fields = []

      @@required_fields.each do |field|
        if !claim.key?(field)
          missing_fields << field
        end
      end

      if missing_fields.any?
        raise Exception.new 'DID Token missing required fields: %s' % missing_fields.join(", ")
      end
    end
  end
end
