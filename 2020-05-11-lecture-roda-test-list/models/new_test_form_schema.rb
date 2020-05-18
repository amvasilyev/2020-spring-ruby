require 'dry-schema'

NewTestFormSchema = Dry::Schema.Params do
  required(:name).filled(:string)
  required(:date).filled(:string, format?: /\d{4}-\d{2}-\d{2}/)
  required(:description).filled(:string)
end
