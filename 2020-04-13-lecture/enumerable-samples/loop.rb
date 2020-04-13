short_enum = 1.upto(5)
long_enum = ('a'..'z').to_enum

loop do
  puts "#{short_enum.next} - #{long_enum.next}"
end

short_enum.next
