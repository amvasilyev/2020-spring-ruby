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
      author: parameters[:author],
      published_on: parameters[:published_on],
      mark: parameters[:mark],
      circulation: parameters[:circulation],
      cover_type: parameters[:cover_type]
    )
    book_id
  end

  def update_book(id, parameters)
    book = @books[id]
    book.title = parameters[:title]
    book.author = parameters[:author]
    book.published_on = parameters[:published_on]
    book.mark = parameters[:mark]
    book.circulation = parameters[:circulation]
    book.cover_type = parameters[:cover_type]
  end

  def delete_book(id)
    @books.delete(id)
  end
end
