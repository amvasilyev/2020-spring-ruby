array = (1..150).to_a

array.each_slice(9) { |sub_array| p sub_array.length }

enum = array.enum_for(:each_slice, 56)
pp enum.next 