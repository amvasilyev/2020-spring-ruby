# frozen_string_literal: true

require 'roda'

# The core class of the web application for managing tests
class TestApp < Roda
  route do |r|
    r.root do
      'Hello, world!'
    end
  end
end
