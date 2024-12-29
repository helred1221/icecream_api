# frozen_string_literal: true

# Rate Service Class
class RateService
  class << self
    def save(rate)
      rate.save
    end
  end
end
