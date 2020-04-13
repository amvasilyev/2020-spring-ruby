res = [1, 4, 5, 6].map do |num|
  num.to_s
end

pp res

res_two = [1, 4, 5, 6].map(&:to_s)

pp res_two

to_s_proc = :to_s.to_proc
pp to_s_proc.call(55)
