# frozen_string_literal: true

# The list of possible book cover types
module BookCoverType
  THIN = 'Тонкая'
  THICK = 'Толстая'

  def self.all_types
    [
      THICK, THIN
    ]
  end
end
