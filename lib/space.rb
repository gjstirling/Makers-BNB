
class Space

  attr_reader :name, :description, :price, :capacity, :owner_id

  def initialize(name, description, price, capacity, owner_id)
    @name = name
    @description = description
    @price = price
    @capacity = capacity
    @owner_id = owner_id

 # When instance of class is created, information needs to be stored 
# inside the spaces table inside the DB (name of working DB)
  end
  
  

end