# frozen_string_literal: true

require 'roda'

# The core class of the web application for managing tests
class TestApp < Roda
  opts[:root] = __dir__
  plugin :public

  route do |r|
    r.public

    r.root do
      'Hello, world!'
    end
  end
end
