# frozen_string_literal: true

# Product Service Class
class ProductService
  class << self
    def save(product)
      product.save
    end

    def update(product, product_params)
      product.update(product_params)
    end

    def destroy(product)
      product.destroy
    end
  end
end
