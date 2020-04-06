class SizeMatters
  include Comparable

  def initialize(string)
    @string = string
  end

  def size
    @string.size
  end

  def <=>(other)
    size <=> other.size
  end
end

small = SizeMatters.new('yargu')
medium = SizeMatters.new('university')
large = SizeMatters.new('P.G. Demidov Yarsolavl State University')

pp small <=> large
pp large <=> medium
if medium >= small
  puts 'Medium string is larger!'
end

