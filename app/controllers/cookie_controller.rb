class CookieController < ApplicationController
  def set_cookie
    cookies.signed[:userr_id] = current_user.id
    cookies.encrypted[:expiration_date] = Date.tomorrow
    redirect_to action: "read_cookie"
  end

  def read_cookie
    cookies.encrypted[:expiration_date]
  end
end
