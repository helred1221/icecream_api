# frozen_string_literal: true

# User Filter class
class UserFilter
  class << self
    def retrieve_all
      User.all
    end

    def find_by_id(id)
      User.find_by(id: id)
    end
  end
end
