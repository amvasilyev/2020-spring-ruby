def two_times
  yield
  yield
end

two_times { puts 'Wake up, Neo!' }

def example
  pp yield
  pp 'inside example'
  'example'
end

puts 'testing break'
pp example {
  break
  'some'
}

puts 'testing next'
pp example {
  next
  'some'
}

puts 'testing break with args'
pp example {
  break 'break-return!'
  'some'
}

puts 'testing next with args'
pp example {
  next 'next-return!'
  'some'
}
