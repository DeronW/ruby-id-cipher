# IdCipher

cipher Integer to another Integer, make customer confused with the real number

## Installation

Add this line to your application's Gemfile:

    gem 'id_cipher'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install id_cipher

## Usage

set cipher slat in two ways:

1. if use this in ruby on rails, add config in ``settings.yml``:

        Settings.id_cipher_key = 'something.like.this'
        
2. or set IdCipher::KEY direct

        module IdCipher
            KEY = 'something.like.this'
        end
        
notice: the key length must be over 16, should not longer than 256.

#### code example

> IdCipher.encrypt(1) # puts 42491238512

>IdCipher.decrypt(42491238512) # puts 1

**the result about encrypt is depend on key**

IdCipher has two method, most of time, result of two method will be same.
but **DO NOT** use them obscurely.

ID cipher use C ``pack`` function, so it has up limmit for id,
``pack`` function use 'L' type pack id, it's a unsigned long type, 
value range is 0~(2**32 - 1), means it must less than 4294967295

## Contributing

1. Fork it ( https://github.com/[my-github-username]/id_cipher/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
