# frozen_string_literal: true

# Address Service Class
class AddressService
  class << self
    def save(address)
      address.save
    end
  end
end
