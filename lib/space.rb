
class Space

  attr_reader :name, :description, :price, :max_guests, :owner_id

  def initialize(name, description, price, max_guests, owner_id)
    @name = name
    @description = description
    @price = price
    @max_guests = max_guests
    @owner_id = owner_id
  end

end