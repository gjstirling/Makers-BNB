
class Space

  attr_reader :name, :description, :price, :max_guests, :owner_id

  def initialize(name, description, price, max_guests, owner_id)
    @name = name
    @description = description
    @price = price
    @max_guests = max_guests
    @owner_id = owner_id

 # When instance of class is created, information needs to be stored 
# inside the spaces table inside the DB (name of working DB)
  end
  
  

end