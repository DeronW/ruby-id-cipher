require 'openssl'


module IdCipher
  VERSION = "0.1.0"
end


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
    end

    def key
      (defined? Setting) && Setting.id_cipher_key ||
          IdCipher::KEY ||
          (raise TypeError, 'no cipher key found. you can set key within Settings.yml, id_cipher_key="cipher slat" or refine IdCipher::KEY')
    end

    def pack(number)
      [number].pack('L')
    end

    def unpack(crypto_text)
      crypto_text.unpack('L')[0]
    end

    def encrypt(id)
      id = id.to_i
      @cipher.encrypt
      @cipher.key = key
      self.unpack @cipher.update(self.pack(id))
    end

    def decrypt(eid)
      eid = eid.to_i
      @cipher.decrypt
      @cipher.key = key
      self.unpack @cipher.update(self.pack(eid))
    end

  end
end
