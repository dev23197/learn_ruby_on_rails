class ApplicationController < ActionController::Base
  def default_url_options
    { locale: I18n.locale }
  end
end



# callbacks - before_action

class ApplicationController < ActionController::Base
  before_action :require_login

  private
  def require_login
    unless logged_in?
      flash[:error] = "you must be logged in to access this section"
      redirect_to new_login_url # halts request cycle
    end
  end
end



# after_action and around_action

class ApplicationController < ActionController::Base
  around_action :measure_execution_time

  private
  def measuree_execution_time
    start_time = Time.now
    yield # THis executes the action
  end_time = Time.now

  duration = end_time - start_time
  Rails.logger.info "Action #{action_name} from controller #{controller_name}
   took #{duration.round(2)} seconds to execute."
  end
end



# other ways to use callbacks

class ApplicationController < ActionController::Base
  before_action do |controller|
    unless controller.send(:logged_in?)
      flash[:error] = "you must be logged in to access this section"
      redirect_to new_login_url
    end
  end
end


# around_action callback to measure execution time with a class:
