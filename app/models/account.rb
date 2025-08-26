class Account < ApplicationRecord
  validates :subdomain, exclusion: { in: ->(account) {
    account.reserved_subdomains
  } }

  def reserved_subdomains
    %w[ www us ca jp admin ]
  end
end
