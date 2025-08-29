class Test < ApplicationRecord
  validates :name, :login, :email, presence: true
end














# class Test < ApplicationRecord
# validates :terms_of_services, acceptance: { accept: "yes" }
# validates :eula, acceptance: { accept: [ "TRUE", "aacepted" ] }
# end



# class Person < ApplicationRecord
# validates :email, confirmation: true
# validates :email_confirmation, presence: true
# end


#
