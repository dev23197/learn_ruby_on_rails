class MainController < ApplicationController
  def index
    # will persist all flash values.
    flash.keep

    # you can also use a key to keep only some king of value.
    # flash.keep(:notice)
    redirect_to users_url
  end
end
