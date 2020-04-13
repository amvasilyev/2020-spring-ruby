reach = Proc.new do |param|
  puts "You called proc with param '#{param}'"
end
reach.call(42)
reach.call('Nightmare')
