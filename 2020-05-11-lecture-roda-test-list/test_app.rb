# frozen_string_literal: true

require 'forme'
require 'roda'
require_relative 'models'

# The core class of the web application for managing tests
class TestApp < Roda
  opts[:root] = __dir__
  plugin :environments
  plugin :forme
  plugin :render

  configure :development do
    plugin :public
    opts[:serve_static] = true
  end

  opts[:tests] = TestList.new([
                                Test.new('Лабораторая №1', '2020-04-05', 'Проверка знаний по языку Ruby'),
                                Test.new('Лабораторая №2', '2020-04-20', 'Проверка умений написания приложений на языке Ruby'),
                                Test.new('Финальный экзамен', '2020-06-20', 'Проверка всех знаний и умений')
                              ])

  route do |r|
    r.public if opts[:serve_static]

    r.root do
      'Hello, world!'
    end

    r.on 'tests' do
      r.is do
        @params = DryResultFormeAdapter.new(TestFilterFormSchema.call(r.params))
        @filtered_tests = if @params.success?
                            opts[:tests].filter(@params[:date], @params[:description])
                          else
                            opts[:tests].all_tests
                          end
        view('tests')
      end

      r.on 'new' do
        r.get do
          @params = {}
          view('new_test')
        end

        r.post do
          @params = DryResultFormeAdapter.new(NewTestFormSchema.call(r.params))
          if @params.success?
            opts[:tests].add_test(Test.new(@params[:name], @params[:date], @params[:description]))
            r.redirect '/tests'
          else
            view('new_test')
          end
        end
      end
    end
  end
end
