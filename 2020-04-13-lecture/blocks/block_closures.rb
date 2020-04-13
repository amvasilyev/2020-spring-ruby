def times(thing)
  lambda do |times|
    times * thing
  end
end

fourty_two = times(42)
pp fourty_two.call(2)
pp fourty_two.call(5)
