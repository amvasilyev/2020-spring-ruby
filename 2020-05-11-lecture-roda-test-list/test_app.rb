# frozen_string_literal: true

require 'roda'
require_relative 'models'

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

    @tests = TestList.new([
                            Test.new('Лабораторая №1', '2020-04-05', 'Проверка знаний по языку Ruby'),
                            Test.new('Лабораторая №2', '2020-04-20', 'Проверка умений написания приложений на языке Ruby'),
                            Test.new('Финальный экзамен', '2020-06-20', 'Проверка всех знаний и умений')
                          ])

    r.root do
      'Hello, world!'
    end

    r.on 'tests' do
      r.is do
        @params = InputValidators.check_date_description(r.params['date'], r.params['description'])
        @filtered_tests = if @params[:errors].empty?
                            @tests.filter(@params[:date], @params[:description])
                          else
                            @tests.all_tests
                          end
        view('tests')
      end

      r.on 'new' do
        r.get do
          view('new_test')
        end
      end
    end
  end
end
