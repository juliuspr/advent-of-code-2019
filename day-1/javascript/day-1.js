// import { FileReader } from 'file-reader';
// import 'fuel_for_module' from './fuel_for_module'
const assert_equal = require('./../../test.js')
const fs = require('fs');



const calc_fuel = (mass) => {
  let fuel = Math.floor(parseInt(mass) / 3) - 2

  return fuel < 0 ? 0 : fuel;
};

let fuel_for_fuel = function (total, initial_fuel) {
  if (initial_fuel < 1) {
    return total;
  } else {
    return fuel_for_fuel(total + initial_fuel, calc_fuel(initial_fuel));
  }
};

const fuel_for_module = module_mass => {
  return fuel_for_fuel(0, calc_fuel(module_mass));
}

fs.readFile('./../day-1-input.txt', 'utf8', function(err, contents) {
  
  const array_of_modules = contents.split(/\n/)

  const result = array_of_modules.map(fuel_for_module).reduce((acc, curr) => acc + curr)

  console.log(result);
});

// TEST
assert_equal(calc_fuel(23), 5, 'calc_fuel test');
assert_equal(fuel_for_fuel(0, 100), 139, 'fuel_for_fuel test')
assert_equal(fuel_for_module(36), 11, 'fuel_for_module test')
