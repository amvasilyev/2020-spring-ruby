# frozen_string_literal: true

require 'dry-schema'

require_relative 'schema_types'
require_relative 'book_cover_type'

BookFormSchema = Dry::Schema.Params do
  required(:title).filled(SchemaTypes::StrippedString)
  required(:author).filled(SchemaTypes::StrippedString)
  required(:published_on).filled(:date)
  required(:mark).filled(:integer, gteq?: 1, lteq?: 5)
  required(:circulation).filled(:float, gt?: 0)
  required(:cover_type).filled(SchemaTypes::StrippedString, included_in?: BookCoverType.all_types)
end
