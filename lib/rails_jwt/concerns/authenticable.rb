module Authenticable

  extend ActiveSupport::Concern

  def authenticate!
    @user = User.find(subscriber) rescue nil
    raise Errors::UnauthorizedAccessError if @user.nil?
  end

  private

  def subscriber
    request.env['jwt.token.payload'].try(:fetch, 'sub', 0)
  end

end
