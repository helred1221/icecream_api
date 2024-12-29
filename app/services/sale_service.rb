# frozen_string_literal: true

# Sale Service Class
class SaleService
  class << self
    def save(sale)
      sale.save
    end
  end
end
