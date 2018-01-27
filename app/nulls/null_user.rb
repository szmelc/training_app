class NullUser

  def self.avatar
    '...'
  end

  def method_missing(*args, &block)
    self
  end
end
