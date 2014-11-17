require 'openssl'
require "id_cipher/version"


module IdCipher

  class << self
    def encrypt(id)
      IntegerCipher.new.encrypt(id)
    end

    def decrypt(id)
      IntegerCipher.new.decrypt(id)
    end
  end

  private

  class IntegerCipher

    # this crypto method use ARC4 cipher integer
    # ARC4加密算法优点是速度快, 基于bit位xor的算法
    # 该算法在一定数量后会重复,既存在最大值,超过最大值后无法区分当前是原文还是密文
    # 该算法设计只用于加密正整数,加密范围为整数长整型

    def initialize
      @cipher = OpenSSL::Cipher::Cipher.new('rc4')
      @key = Setting.id_cipher_key
    end

    def pack(number)
      raise TypeError, "#{number} is not a Fixnum" if number.class != Fixnum
      [number].pack('L')
    end

    def unpack(crypto_text)
      raise TypeError, "#{crypto_text} is not a String" if crypto_text.class != String
      crypto_text.unpack('L')[0]
    end

    def encrypt(id)
      @cipher.encrypt
      @cipher.key = @key
      self.unpack @cipher.update(self.pack(id))
    end

    def decrypt(id)
      @cipher.decrypt
      @cipher.key = @key
      self.unpack @cipher.update(self.pack(id))
    end

  end
end
