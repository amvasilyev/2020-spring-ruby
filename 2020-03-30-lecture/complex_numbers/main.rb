require_relative 'my_complex'

complex_one = MyComplex.new(10, 5)
complex_two = MyComplex.new(15, -60)

pp complex_one
puts complex_one
puts complex_one.real
pp complex_two
puts complex_two
puts complex_two.imaginary

sum = complex_one.add(complex_two)
puts "Sum of the complex numbers: #{sum}"
