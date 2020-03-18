require 'csv'

require_relative 'book_in_stock'
require_relative 'books'

class BooksReader
  def read_in_books(*filenames)
    books = Books.new
    filenames.each do |filename|
      CSV.foreach(filename, headers: true) do |row|
        books.add_book(BookInStock.new(
          row['ISBN'], Float(row['Price'])
        ))
      end
    end
    books
  end
end

reader = BooksReader.new
books = reader.read_in_books(*ARGV)
amount = books.books_amount
pp amount
pp books.books_amount_hash_expert
