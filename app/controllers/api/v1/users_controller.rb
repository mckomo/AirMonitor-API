module API::V1
  class UsersController < API::BaseController

    include Authenticable

    before_action :authenticate!, only: [:show]

    # GET /users/1
    def show
      render  json: @user
    end

  end
end