# encoding: utf-8
require 'minitest/autorun'
require_relative '../lib/regexp_m17n'

class RegexpTest < MiniTest::Unit::TestCase
  def test_non_empty_string
    Encoding.list.each do |enc|
      text_encoded = '.'.encode(enc)
      assert(RegexpM17N.non_empty?(text_encoded))
    end
  end
end
