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





# STREAMING AND FILE DOWNLOADS
# how to use send_dats:
require "prawn"
class ClientsController < ApplicationController
  def download_pdf
    client = Client.find(params[:id])
    send_data generate_pdf(client),
    filename: "#{client.name}.pdf",
    type: "application/pdf"
  end

  private
  def generate_pdf(client)
    Prawn::Document.new do
      text client.name, align: :center
      text "Address: #{client.address}"
      text "Email: #{client.email}"
    end.render
  end
end


# Sending filees
# using send_file method

class ClientsController < ApplicationController
  def download_pdf
  send_file("#{Rails.root}/files/clients/#{client.id}.pdf",
              filename: "#{client.name}.pdf",
              type: "application/pdf")
end
end



# RESTful Downloads
class ClientsController < AppplicationController
  def show
    @client = Client.find(params[:id])

    respond_to do |format|
      format.html
      format.pdf { render pdf: generate_pdf(@client) }
    end
  end
end
