# frozen_string_literal: true

# The information about the good books
Book = Struct.new(:id, :title, :author, :published_on, :mark, :circulation, :cover_type, keyword_init: true)
