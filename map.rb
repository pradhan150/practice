class Array
  def my_map(&block)
    output = []

    each do |i|
      output << block.call(i)
    end

    output
  end

  def my_map2
    output = []

    each do |i|
      output << yield(i)
    end

    output
  end
end

arr = [1, 2, 3, 4]
p(arr.my_map2 { |i| i + 2 })
p(arr.my_map { |i| i * 2 })
