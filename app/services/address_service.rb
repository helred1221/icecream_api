# frozen_string_literal: true

# Address Service Class
class AddressService
  class << self
    def save(address)
      address.save
    end

    def update(address, address_params)
      address.update(address_params)
    end

    def destroy(address)
      address.destroy
    end
  end
end
