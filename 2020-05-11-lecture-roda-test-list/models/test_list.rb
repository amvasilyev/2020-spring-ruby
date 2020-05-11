# frozen_string_literal: true

require 'forwardable'

# The list of tests to manage
class TestList
  extend Forwardable
  def_delegator :@tests, :each, :each_test

  def initialize(tests = [])
    @tests = tests
  end
end
