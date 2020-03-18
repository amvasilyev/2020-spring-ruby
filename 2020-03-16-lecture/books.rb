class Books
  def initialize
    @books = []
  end

  def add_book(book_in_stock)
    @books.append(book_in_stock)
  end

  def books_amount
    frequency = {}
    @books.each do |book|
      frequency[book.isbn] = if frequency.key?(book.isbn)
                               frequency[book.isbn] + 1
                             else
                               1
                             end
    end
    frequency
  end

  def books_amount_hash_expert
    frequency = Hash.new(0)
    @books.each do |book|
      frequency[book.isbn] += 1
    end
    frequency
  end
end
