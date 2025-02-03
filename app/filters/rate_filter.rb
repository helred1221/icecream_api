# frozen_string_literal: true

# Rate Filter class
class RateFilter
  class << self
    def retrieve_all
      Rate.all
    end

    def find_by_id(id)
      Rate.find_by(id: id)
    end
  end
end
