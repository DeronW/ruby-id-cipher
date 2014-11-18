# IdCipher

cipher Integer to another Integer, make people confused with the real number.

## Installation

Add this line to your application's Gemfile:

    gem 'id_cipher'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install id_cipher

## Usage

set a key: use it like Settings.id_cipher_key='something.like.this'

IdCipher.encrypt(1) # puts 42491238512
IdCipher.decrypt(42491238512) # puts 1

the result about encrypt is depend on key

## Contributing

1. Fork it ( https://github.com/[my-github-username]/id_cipher/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
