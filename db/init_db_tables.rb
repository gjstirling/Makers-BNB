class CreateTables

    def self.if_not_exists(connection)

      # User table 
      connection.exec("
        CREATE TABLE IF NOT EXISTS users(
        id SERIAL PRIMARY KEY,
        name VARCHAR(100) NOT NULL,
        created_at TIMESTAMP default current_timestamp,
        )
      ")
      # Space table 
      connection.exec("
        CREATE TABLE IF NOT EXISTS spaces(
        id SERIAL PRIMARY KEY,
        user_id INT NOT NULL,
        name VARCHAR(100) NOT NULL,
        price INT NOT NULL,
        description VARCHAR(500) NOT NULL,
        capacity INT NOT NULL,
        created_at TIMESTAMP default current_timestamp,
        )
      ")

      # Booking table 
      connection.exec("
        CREATE TABLE IF NOT EXISTS bookings(
        id SERIAL PRIMARY KEY,
        user_id INT NOT NULL,
        space_id INT NOT NULL,
        start_date INT NOT NULL, 
        end_date INT NOT NULL,
        created_at TIMESTAMP default current_timestamp,
        )
      ")
    end
  
  end
  