class Frequency
  def input_values
    puts 'enter the no. of inputs:'

    length = gets.chomp.to_i
    input_arr = []

    (0...length).each do |i|
      input_arr[i] = gets.chomp
    end

    input_arr
  end

  def calculate_frequency(input_arr)
    hash = {}

    input_arr.each do |i|
      hash[i] = (hash[i] || 0) + 1
    end

    hash
  end

  def print_result(result)
    result.each do |key, value|
      puts "frequency of #{key} is #{value}"
    end
  end
end

f = Frequency.new
inputs = f.input_values
result = f.calculate_frequency(inputs)
f.print_result(result)
