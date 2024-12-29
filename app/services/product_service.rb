# frozen_string_literal: true

# Product Service Class
class ProductService
    class << self

        def save(product)
            product.save
        end

    end
end