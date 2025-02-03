# frozen_string_literal: true

# Sale Products Service Class
class SaleProductsService
  class << self
    def save(sale_product)
      sale_product.save
    end

    def update(sale_product, sale_product_params)
      sale_product.update(sale_product_params)
    end

    def destroy(sale_product)
      sale_product.destroy
    end
  end
end
