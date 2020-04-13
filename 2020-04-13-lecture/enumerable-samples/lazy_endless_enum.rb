numbers = Enumerator.new do |yielder|
  number = 0
  loop do
    number += 1
    yielder.yield number
  end
end.lazy

pp numbers.select { |num| num.even? } .first(10)
