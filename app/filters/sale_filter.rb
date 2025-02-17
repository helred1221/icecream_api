# frozen_string_literal: true

# Sale Filter class
class SaleFilter
  class << self
    def retrieve_all
      Sale.all
    end

    def find_by_id(id)
      Sale.find_by(id: id)
    end
  end
end
