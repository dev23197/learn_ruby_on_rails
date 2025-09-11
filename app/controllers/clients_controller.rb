class ClientsController < ApplicationController
  def index
    if params[:status] == "activated"
      @clients = Client.activated
    else
      @clients = Client.inactivated
    end
  end



  def create
    @client = Client.new(params[:client])
    if @client.save
      redirect_to @client
    else
      render "new"
    end
  end
end



# To do this, you can use flash.now in the same way you use the normal flash:
class ClientsController < ApplicationController
 def create
   @client = Client.new(client_params)
   if @client.save
     # ...
   else
    flash.now[:error] = "could not save client"
    render action: "new"
   end
 end
end
