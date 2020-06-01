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
    book_id = if @books.empty?
                1
              else
                @books.keys.max + 1
              end
    @books[book_id] = Book.new(id: book_id, **parameters.to_h)
    @books[book_id]
  end

  def add_real_book(book)
    @books[book.id] = book
  end

  def update_book(id, parameters)
    book = @books[id]
    parameters.to_h.each do |key, value|
      book[key] = value
    end
  end

  def delete_book(id)
    @books.delete(id)
  end
end
