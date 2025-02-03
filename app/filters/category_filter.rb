# frozen_string_literal: true

# Category Filter Class
class CategoryFilter
  class << self
    def retrieve_all
      Category.all
    end

    def find_by_id(id)
      Category.find_by(id: id)
    end
  end
end
