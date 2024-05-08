# frozen_string_literal: true

class Users::Facade
  module_function

  def register(name)
    User.create!(name: name)
  end

  def verify(user_id)
    user = User.find_by(id: user_id)
    raise StandardError, 'not found' if user.nil?
    raise StandardError, 'already verified' if user.is_verified?

    user.update!(is_verified: true)
  end

  def verified_user_ids
    User.verified.ids
  end
end
