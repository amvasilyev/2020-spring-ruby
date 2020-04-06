class Parent
  def say_hello
    puts 'Hello, public!'
  end

  def to_s
    "Parent class"
  end
end

parent = Parent.new
parent.say_hello

class Child < Parent
  def to_s
    "Child class is the subclass of the #{super}"
  end
end

child = Child.new
child.say_hello

puts "Child superclass: #{Child.superclass}"
puts "Parent superclass: #{Parent.superclass}"
puts "Parent superclass: #{Parent.superclass.superclass}"
pp Parent.superclass.superclass.superclass

puts parent
puts child
