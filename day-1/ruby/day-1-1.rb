require('./../../test.rb')


class FuelCalculator
  def initialize(string_from_file)
    @data = string_to_array(string_from_file)
  end

  def total_fuel
    @data.map(&method(:fuel_per_module)).reduce(:+)
  end

  private

  def string_to_array(string)
    string.strip.split("\n")
  end

  def fuel_per_module(mass)
    mass.to_i / 3 - 2
  end
end


file = File.open('../day-1-input.txt')
file_data = file.read

fuel_calc = FuelCalculator.new(file_data)

puts "ANSWER:"
puts fuel_calc.total_fuel


puts "\nTESTS:"
test_str = "14\n15\n20\n"
test_calc = FuelCalculator.new(test_str)

assert_equal(test_calc.send(:string_to_array, "1\n2\n5\n10\n ").length, 4, "splitting string into array")
assert_equal(test_calc.send(:fuel_per_module, "23"), 5, "indivudal module fuel requirement")
assert_equal(test_calc.send(:total_fuel), 9, "total fuel requirement")