# frozen_string_literal: true

# Sale Service Class
class SaleService
  class << self
    def save(sale)
      sale.save
    end

    def update(sale, sale_params)
      sale.update(sale_params)
    end

    def destroy(sale)
      sale.destroy
    end
  end
end
