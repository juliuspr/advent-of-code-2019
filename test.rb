def assert_equal(actual, expected, context = "")
  actual == expected ? puts("#{context} is passing!") : STDERR.puts("ERROR (#{context}): Expected: #{expected}, got #{actual}")
end