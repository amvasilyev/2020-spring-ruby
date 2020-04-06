module Debug
  def who_am_i?
    "#{self.class.name} (id: #{self.object_id})"
  end

  def self.greet
    'Hello!'
  end
end

class Test
  include Debug
end

test = Test.new
puts test
puts test.who_am_i?
puts Debug.greet
