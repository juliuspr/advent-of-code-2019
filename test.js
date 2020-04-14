function assert_equal(actual, expected, context = "") {
  actual == expected ? console.log(context + " is passing!") : console.log("ERROR (" + context +"): Expected: " + expected + ", got " + actual)
}

module.exports = assert_equal;