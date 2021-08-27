require 'pg'
require './lib/string.rb'
require './db/init_db_conn.rb'

class CreateBooking

  def self.check_params?(form_inputs)
    ret_value = true
    form_inputs.each do |key, value|
        l = value.length unless value.is_a?(Integer)
        ret_value = false if (key == 'confirmed' && ![true, false].include?(value))
        ret_value = false if (key == 'start_date' && (!value.is_a?(Integer) || value <=0))
        ret_value = false if (key == 'end_date' && (!value.is_a?(Integer) || value <=0))
        ret_value = false if (key == 'user_id' && (!value.is_a?(Integer) || value <=0))
        ret_value = false if (key == 'space_id' && (!value.is_a?(Integer) || value <=0))
    end
    ret_value
  end

  def self.add_booking(form_inputs)
    table_columns = []
    table_values = []
    form_inputs.each do |key, value|
        if ['user_id', 'space_id', 'confirmed', 'start_date', 'end_date'].include?(key)
          table_columns << key # .clean_key
          table_values << value.clean_value
        end
    end
    db_connection = Connect.initiate(ENV["DB_IN_USE"])
    query = "INSERT INTO bookings(#{table_columns.join(', ')}) VALUES(#{table_values.join(', ')}) RETURNING id"
    db_connection.exec(query)
  end

  def self.get_space(id)

    query = "SELECT * FROM spaces WHERE id = " << id
    db_connection = Connect.initiate(ENV["DB_IN_USE"])
    db_connection.exec(query).first
  end

end
