def safetly_open(filename)
  file = File.open(filename)
  file.each do |line|
    yield line
  end
  file.close
end

safetly_open(ARGV[0]) do |line|
  puts line
end

File.open(ARGV[0]) do |file|
  puts file.lines
end
