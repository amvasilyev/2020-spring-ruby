# frozen_string_literal: true

require 'dry-schema'

BookDeleteSchema = Dry::Schema.Params do
  required(:confirmation).filled(true)
end
