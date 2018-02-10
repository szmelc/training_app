class NullUser

  def self.bio
    '-'
  end

  def self.title
    '-'
  end

  def self.country
    '-'
  end

  def self.phone_number
    '-'
  end

  def website
    '-'
  end

  def method_missing(*args, &block)
    self
  end
end
