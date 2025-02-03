# frozen_string_literal: true

# Users Rates Products Filter Class
class UserRateProductFilter
  class << self
    def retrieve_all
      UsersRatesProducts.all
    end

    def find_by_id(id)
      UsersRatesProducts.find_by(id: id)
    end
  end
end
