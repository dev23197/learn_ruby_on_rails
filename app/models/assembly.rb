class Assembly < ApplicationRecord
  has_many :manifests
  has_many :parts, through: :manifests
end
