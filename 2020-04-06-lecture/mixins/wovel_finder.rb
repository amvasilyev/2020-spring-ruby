class WovelFinder
  include Enumerable

  def initialize(string)
    @string = string
  end

  def each
    @string.scan(/[aoeuiy]/).each do |wovel|
      yield wovel
    end
  end
end

finder = WovelFinder.new('This is the long string that mean to mean something!')
finder.each do |wovel|
  puts wovel
end

puts "Unique wovels: #{finder.uniq}"
