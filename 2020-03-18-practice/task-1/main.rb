require_relative 'my_complex'

def main
    my_complex_one = MyComplex.new
    my_complex_two = MyComplex.new
    pp my_complex_one
    pp my_complex_two
end

if __FILE__ == $0
    main
end