class Applicant
  include ActiveModel::Serialization

  attr_accessor :name, :age

  def attributes
    # Declaration of attributes that will be serialized
    { "name" => nil, "age" => nil }
  end

  def capitalized_name
    # Declared methods can be later included in the serialized hash
    name&.capitalize
  end
end
