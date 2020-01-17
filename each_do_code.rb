class Array
  def my_each
    i = 0

    while i < size
      yield at(i)
      i += 1
    end

    self
  end
end

[1, 2, 3].my_each do |i|
  p i * 3
  p i * 4
end
