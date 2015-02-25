require 'minitest/autorun'
require_relative '../lib/id_cipher.rb'


module IdCipher
  KEY = '0123456789abcdef'
end


class TestCipher < MiniTest::Unit::TestCase

  def setup

  end

  def test_encrypt
    assert_equal 1497393285, IdCipher.encrypt(1)
  end

  def test_decrypt
    assert_equal 1, IdCipher.decrypt(1497393285)
  end

  def test_encrypt_with_string
    assert_equal 1497393407, IdCipher.encrypt('123')
  end

  def test_decrypt_with_string
    assert_equal 123, IdCipher.encrypt('1497393407')
  end

end
