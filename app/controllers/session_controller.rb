class SessionController < ApplicationController
  def create
    if user = User.authenticate_by(email: params[:email], password: params[:password])
      # save the user ID in the session so it can be used in
      # subsequent requests
      session[:current_user_id] = user.id
      redirect_to root_url
    end
  end
end



# To remove something from the session, delete the key/value pair. Deleting the current_user_id key from the session is a typical way to log the user out:


class SessionsController < ApplicationController
  def destroy
    session.delete(:current_user_id)
    # Clear the current user as well
    @current_user = nill
    redirect_to root_url, status: :see_other
  end
end


# the controller can set a flash message which can be displayed to the user on the next request:

class SessionsController < ApplicationController
  def destroy
    session.delete(:current_user_id)
    flash[:notice] = "You have successsfully logged out."
    redirect_to root_url, status: :see_other
  end
end
