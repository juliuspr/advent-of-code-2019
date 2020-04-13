require('./../../test.rb')


class FuelCalculator
  def initialize(string_from_file)
    @data = string_to_array(string_from_file)
  end

  def total_fuel
    @data.map(&method(:fuel_needs_for_module)).reduce(:+)
  end

  private

  def string_to_array(string)
    string.strip.split("\n").map(&:to_i)
  end

  def fuel_needs_per_mass_unit(mass)
    mass.to_i / 3 - 2
  end

  def fuel_needs_for_module(mass_of_module)
    fuel_needs_for_fuel(0, fuel_needs_per_mass_unit(mass_of_module))
  end

  def fuel_needs_for_fuel(total, mass)
    if mass < 1
      return total
    else
      fuel_needs_for_fuel(total + mass, fuel_needs_per_mass_unit(mass))
    end
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
assert_equal(test_calc.send(:string_to_array, "1\n2\n5\n10\n ")[3].class, Integer, "array of integers")
assert_equal(test_calc.send(:fuel_needs_per_mass_unit, "23"), 5, "formula for calculating fuel to mass ratio")

assert_equal(test_calc.send(:fuel_needs_for_module, "36"), 11, "fuel per module")

assert_equal(test_calc.send(:total_fuel), 9, "total fuel requirement")
