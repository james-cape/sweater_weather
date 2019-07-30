class Restaurant
  attr_reader :name, :address

  def initialize(attributes)
    @name = attributes[:name]
    @address = attributes[:location][:display_address].join(", ")
  end
end
