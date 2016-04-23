module Authenticable

  extend ActiveSupport::Concern

  def authenticate!
    request.user = User.find_by_id(subscriber_id) || raise(UnauthorizedAccessError)
  end

  private

  def subscriber_id
    request
        .env['jwt.token.payload']
        .try(:fetch, 'sub')
  end

end
