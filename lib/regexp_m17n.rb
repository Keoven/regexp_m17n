class String
  alias_method :original_encode, :encode

  def encode(encoding, *options)
    original_encode(encoding, *options)
  rescue Encoding::ConverterNotFoundError
    force_encoding(encoding)
  end
end

module RegexpM17N
  def self.non_empty?(str)
    str.encode(Encoding::UTF_8) =~ /^.+$/
  end
end
