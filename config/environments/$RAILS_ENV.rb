config.action_mailer.delivery_method = :sendmail
# Default to:
# config.action_mailer.sendmail_settings = {
# location: '/usr/sbin/sendmail',
#   arguments: %w[ -i ]
#   }


config.action_mailer.perform_deliveries = true
config.action_mailer.raise_delivery_errors = true
config.action_mailer.default_options = { from: "no-reply@example.com" }
