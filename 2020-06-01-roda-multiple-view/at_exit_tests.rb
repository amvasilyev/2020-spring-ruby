# frozen_string_literal: true

at_exit do
  puts 'called when exiting'
end

at_exit do
  puts 'another call when exiting'
end

puts 'running the application'
