# frozen_string_literal: true

# Sale Products Service Class
class SaleProductsService
  class << self
    def save(sale_products)
      sale_products.save
    end
  end
end
