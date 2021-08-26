require 'digest/sha1'

class String

  def hash_1
    Digest::SHA1.hexdigest(self.to_s)
  end

  def clean_value
    "'" << self.to_s.gsub(/[']/, "&#39;") << "'"
  end

  def clean_key
    self.to_s.gsub(/[^a-z_]/,'')
  end

  def if_is_int
    return self.to_i if self.to_i.is_a?(Integer)
    self
  end

end

class Integer
  def clean_value
    self
  end
end