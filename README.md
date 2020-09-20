# MagicLink Ruby SDK
Admin Ruby SDK for for interacting with Magic.link.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'magiclink_admin_sdk'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install magiclink_admin_sdk

## Configuring the client
To use the features of this gem, first you need to add the `secret_key` to MagicLink client:
```ruby
Magiclink::Client.configure do |c|
  c.secret_key = 'YOUR_MAGICLINK_PRIVATE_KEY'
end
```

## Users
### Get user metadata by issuer
```ruby
user_meta = Magiclink::User.get_metadata_by_issuer("did:ethr:0x5E37cA7DDe4DA255279a281FA29B29702422982f")
# => #<OpenStruct email="sampleuser@example.com", issuer="did:ethr:0x5E37cA7DDe4DA255279a281FA29B29702422982f", public_address="0x5E37cA7DDe4DA255279a281FA29B29702422982f">

user_meta.email # => sampleuser@example.com
user_meta.issuer # => did:ethr:0x5E37cA7DDe4DA255279a281FA29B29702422982f
user_meta.public_address # => 0x5E37cA7DDe4DA255279a281FA29B29702422982f
```
### Logout by issuer
```ruby
Magiclink::User.logout_by_issuer("did:ethr:0x5E37cA7DDe4DA255279a281FA29B29702422982f")
# => {"data"=>{}, "error_code"=>"", "message"=>"", "status"=>"ok"}
```

## Tokens
You can use `parse!` method to parse DIDTokens.
```ruby
sample_did_token = "WyIweDYxM2MyZDlkMjczND...mN2MyZjI5ZDdhMWJcIn0iXQ=="

Magiclink::Token.parse!(sample_did_token)
# => #<Magiclink::Token:0x00007ff2ce676c40 @claim={"iat"=>1600593613, "ext"=>1600594513, "iss"=>"did:ethr:0x5E37cA7DDe4DA255279a281FA29B29702422982f", "sub"=>"ngyQgZ5abLes8rMoccQDNb29CF0at3iHfgfDsqdK49s=", "aud"=>"did:magic:7f8d72a9-f222-25cc-99de-d0f3d724290b", "nbf"=>1234593715, "tid"=>"5f8bc242-9c25-edfd-b579-4ff58d9857db", "add"=>"0x122b7b5e5ff7448f7d2e996b65dc57cc593ded90b4ee649628e97f8d4fde6c7b701d8d14425fb4909407617037f0c3fbeafae72a1262665e2020e7f7c2f29d7a1b"}>
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/licenserocks/magiclink-ruby-sdk. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [GPL V3.0](https://www.gnu.org/licenses/gpl-3.0.txt).

## Code of Conduct

Everyone interacting in the Magiclink project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/licenserocks/magiclink-ruby-sdk/blob/master/CODE_OF_CONDUCT.md).
