# frozen_string_literal: true

require 'roda'

# The core class of the web application for managing tests
class TestApp < Roda
  opts[:root] = __dir__
  plugin :environments
  plugin :render

  configure :development do
    plugin :public
    opts[:serve_static] = true
  end

  route do |r|
    r.public if opts[:serve_static]

    r.root do
      'Hello, world!'
    end

    r.on 'tests' do
      view('tests')
    end
  end
end
