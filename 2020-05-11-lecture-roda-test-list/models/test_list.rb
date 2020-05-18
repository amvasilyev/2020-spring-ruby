# frozen_string_literal: true

require 'forwardable'

# The list of tests to manage
class TestList
  extend Forwardable
  def_delegator :@tests, :each, :each_test

  def initialize(tests = [])
    @tests = tests
  end

  def add_test(test)
    @tests.append(test)
  end

  def all_tests
    @tests.dup
  end

  def filter(date, description)
    @tests.select do |test|
      next if date && !date.empty? && date != test.date
      next if description && !description.empty? && !test.description.include?(description)

      true
    end
  end
end
