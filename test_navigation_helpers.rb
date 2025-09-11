# test_navigation_helpers.rb

# Boot Rails
require_relative "config/environment"

# Include Rails helpers
include Rails.application.routes.url_helpers
include ActionView::Helpers::UrlHelper
include ActionView::Helpers::TagHelper

# Load your custom helper (make sure this file exists: app/helpers/navigation_helpers.rb)
require_relative "app/helpers/navigation_helpers"
include NavigationHelpers

# Example usage
puts navigation_link_to("Home", root_path)
puts navigation_link_to("About", "/about")
