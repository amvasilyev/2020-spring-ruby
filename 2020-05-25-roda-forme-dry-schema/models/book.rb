# frozen_string_literal: true

# The information about the good books
Book = Struct.new(:id, :title, :author, :published_on, :mark, keyword_init: true)
