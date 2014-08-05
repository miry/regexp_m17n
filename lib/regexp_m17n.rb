module RegexpM17N
  def self.non_empty?(str)
    str_encoding = str.encoding
    p str_encoding
    p str_encoding.ascii_compatible?
    p str_encoding.dummy?

    # Returns true for dummy encodings. A dummy encoding is an encoding
    # for which character handling is not properly implemented. It is
    # used for stateful encodings.
    pattern = '^.+$'
    enc_pattern = pattern

    unless str_encoding.dummy?
      enc_pattern = pattern.encode(str_encoding)
    end

    str =~ Regexp.new(enc_pattern)
  rescue => e
    puts "Error"
    puts e
    puts e.backtrace.first
  end
end
