require './db/init_db_conn.rb'

def reset_table_space_and_seed
  seeds = [
    {"name" => "space1", "description" => "bla bla1", "price" => 201, "capacity" => 31, "user_id" => 1},
    {"name" => "space2", "description" => "bla bla2", "price" => 202, "capacity" => 32, "user_id" => 2},
    {"name" => "space3", "description" => "bla bla3", "price" => 203, "capacity" => 33, "user_id" => 3}
  ]
  db_connection = Connect.initiate(ENV["DB_IN_USE"])
  db_connection.exec("TRUNCATE TABLE spaces")
  seeds.each do |seed|
    db_connection.exec("INSERT INTO spaces(name, description, price, capacity, user_id) VALUES('#{seed["name"]}', '#{seed["description"]}', '#{seed["price"]}', '#{seed["capacity"]}', '#{seed["user_id"]}')")
  end
  return seeds
end