require 'dry-schema'

TestFilterFormSchema = Dry::Schema.Params do
  optional(:date).maybe(:string, format?: /\d{4}-\d{2}-\d{2}/)
  optional(:description).maybe(:string)
end
