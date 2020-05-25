# frozen_string_literal: true

require 'dry-schema'

require_relative 'schema_types'

BookNewFormSchema = Dry::Schema.Params do
  required(:title).filled(SchemaTypes::StrippedString)
  required(:author).filled(SchemaTypes::StrippedString)
end
