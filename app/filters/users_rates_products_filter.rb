# frozen_string_literal: true

# Users Rates Products Filter Class
class CategoryFilter
  class << self
    def retrieve_all
      UsersRatesProducts.all
    end

    def find_by_id(id)
      UsersRatesProducts.find(id)
    end
  end
end
