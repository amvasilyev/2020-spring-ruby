class BookInStock
  attr_reader :isbn
  attr_reader :price

  def initialize(isbn, price)
    @isbn = isbn
    @price = price
  end

  def to_s
    "Book ISBN: '#{@isbn}', price: #{@price}"
  end

  def price_in_copeks
    Integer(@price * 100 + 0.5)
  end

  def price_in_copeks=(copeks)
    @price = copeks / 100.0
  end
end

if __FILE__ == $0
  book_one = BookInStock.new('sdasd', 100.56)
  book_two = BookInStock.new('sdfsdf', 2343.3)
  broken_book = BookInStock.new('asdas', 'asdasd') # Никогда не должно случиться
  puts book_one.isbn
  book_one.isbn.sub!(/s/, 'Y') # Чтение опасно!
  pp book_one
  puts book_two.price_in_copeks
  book_two.price_in_copeks = 100500
  puts book_two
end