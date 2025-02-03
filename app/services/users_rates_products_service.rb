# frozen_string_literal: true

# UsersRatesProducts Service class
class UsersRatesProductsService
  class << self
    def save(user_rate_product)
      user_rate_product.save
    end

    def update(user_rate_product, user_rate_product_params)
      user_rate_product.update(user_rate_product_params)
    end

    def destroy(user_rate_product)
      user_rate_product.destroy
    end
  end
end
