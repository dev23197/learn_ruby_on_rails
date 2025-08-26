class Addressvalidator < ApplicationRecord
  def validate(record)
    if record.house_number.blank?
      record.errors.add :house_number, "is required"

    end

    if record.street.blank?
      record.errors.add :street, "is required"
    end

    if record.postcode.blank?
      record.errors.add :postcode, "is required"
    end
  end
end


class Invoice <ApplicationRecord
  validates_with Addressvalidator
end
