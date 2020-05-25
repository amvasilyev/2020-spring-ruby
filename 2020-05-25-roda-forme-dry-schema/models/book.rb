# frozen_string_literal: true

# The information about the good books
Book = Struct.new(:id, :title, :author, :published_on, keyword_init: true)
