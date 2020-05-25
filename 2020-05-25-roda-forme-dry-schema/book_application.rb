# frozen_string_literal: true

require 'forme'
require 'roda'

require_relative 'models'

# The application class
class BookApplication < Roda
  opts[:root] = __dir__
  plugin :environments
  plugin :forme
  plugin :render
  plugin :status_handler

  configure :development do
    plugin :public
    opts[:serve_static] = true
  end

  opts[:books] = BookList.new(
    [
      Book.new(
        id: 25,
        title: 'Programming Ruby 1.9 & 2.0',
        author: 'Dave Thomas'
      ),
      Book.new(
        id: 5,
        title: 'The Pragmatic Programmer',
        author: 'Dave Thomas, Andreyw Hunt'
      )
    ]
  )

  status_handler(404) do
    view('not_found')
  end

  route do |r|
    r.public if opts[:serve_static]

    r.root do
      r.redirect '/books'
    end

    r.on 'books' do
      r.is do
        @books = opts[:books].all_books
        view('books')
      end

      r.on Integer do |book_id|
        @book = opts[:books].book_by_id(book_id)
        next if @book.nil?

        view('book')
      end
    end
  end
end
