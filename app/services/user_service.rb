# frozen_string_literal: true

# User Service Class
class UserService
  class << self
    def save(user)
      user.save
    end
  end
end
