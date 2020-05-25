# frozen_string_literal: true

require_relative 'book'

# The class that contains all our books
class BookList
  def initialize(books = [])
    @books = books.map do |book|
      [book.id, book]
    end.to_h
  end

  def all_books
    @books.values
  end

  def book_by_id(id)
    @books[id]
  end

  def add_book(parameters)
    book_id = @books.keys.max + 1
    @books[book_id] = Book.new(
      id: book_id,
      title: parameters[:title],
      author: parameters[:author]
    )
  end
end
