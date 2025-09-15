class UserMailer < ApplicationMailer
  default from: "notifications@example.com"


  def welcome_email
    @user = params[:user]
    @url = "http://example.com/login"
    mail(to: @user.email, subject: "Welcome to my ausome site")
  end
end


# sending email without template rendering

class UserMailer < ApplicationMailer
  def welcome_email
    mail(to: params[:user].email,
         body: params[:email_body],
         content_type: "text/html",
         subject: "Already rendered!")
  end
end



# sending emails with dynamic delivery options


class UserMAiler < ApplicationMailer
  def welcome_email
    @user = params[:user]
    @url = user_url(@user)
    delivery_options = { user_name: params[:company].smtp_user,
                        password: params[:company].smpt_password,
                      address: params[:company].smpt_host }
                      mail(to: @user.email,
         subject: "Please see the Terms and Conditions attached",
         delivery_method_options: delivery_options)
  end
end


# after mailer


class UserMailer < ApplicationMailer
  before_action { @business, @user = params[:business], params[:user] }

  after_action :set_delivery_options,
               :prevent_delivery_to_guests,
               :set_business_headers

  def feedback_message
  end

  def campaign_message
  end

  private
    def set_delivery_options
      # You have access to the mail instance,
      # @business and @user instance variables here
      if @business && @business.has_smtp_settings?
        mail.delivery_method.settings.merge!(@business.smtp_settings)
      end
    end

    def prevent_delivery_to_guests
      if @user && @user.guest?
        mail.perform_deliveries = false
      end
    end

    def set_business_headers
      if @business
        headers["X-SMTPAPI-CATEGORY"] = @business.code
      end
    end
end



# after deliver


class UserMailer < ApplicationMailer
  after_deliver :mark_delivered
  before_deliver :sandbox_staging
  after_deliver :observe_delivery

def feedback_message
  @feedback = params[:feedback]
end

private
def mark_delivered
  params[:feedback].touch(:delivered_at)
end

    # An Interceptor alternative.
    def sandbox_staging
      message.to = [ "sandbox@example.com" ] if Rails.env.staging?
    end

    # A callback has more context than the comparable Observer example.
    def observe_delivery
      EmailDelivery.log(message, self.class, action_name, params)
    end
end
