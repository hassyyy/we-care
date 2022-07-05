class Array
  def hashify
    Hash[self.map { |e| [e, e]}]
  end
end
