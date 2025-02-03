# frozen_string_literal: true

# Sales Products Filter class
class SaleProductFilter
  class << self
    def retrieve_all
      SaleProduct.all
    end

    def find_by_id(id)
      SaleProduct.find_by(id: id)
    end
  end
end
