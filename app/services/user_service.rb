# frozen_string_literal: true

# User Service Class
class UserService
  class << self
    def save(user)
      user.save
    end

    def update(user, user_params)
      user.update(user_params)
    end

    def destroy(user)
      user.destroy
    end
  end
end
