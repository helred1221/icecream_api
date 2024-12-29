# frozen_string_literal: true

# Category Service Class
class CategoryService
  class << self
    def save(category)
      category.save
    end
  end
end
