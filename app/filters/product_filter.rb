# frozen_string_literal: true

# Product Filter class
class ProductFilter
  class << self
    def retrieve_all
      Product.all
    end

    def find_by_id(id)
      Product.find_by(id: id)
    end
  end
end
