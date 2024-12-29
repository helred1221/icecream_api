# frozen_string_literal: true

# UsersRatesProducts Service class
class UsersRatesProductsService
  class << self
    def save(user_rate_products)
      user_rate_products.save
    end
  end
end
