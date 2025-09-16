

# HTTP basic Authentication
class AdminController < ApplicationController
http_basic_authenticate_with name: "Arthur", password: "42424242"
end

# HttP digest Authentication
class AdminsController < ApplicationController
  USERS = { "admin" => "helloworld" }

  before_action :authenticate

  prrivate
  def authenticate
    authenticate_or_request_with_http_digest do |username|
      USERS[username]
    end
  end
end


# HTTP token Authentication
class PostsController < ApplicationController
  TOKEN = "secret"

  before_action :authenticate

  private
  def authenticate
    authenticate_or_request_with_http_token do |token, option|
      ActiveSupport::SecurityUtils.secure_compare(token, Token)
    end
  end
end
