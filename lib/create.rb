require 'string'
require './db/init_db_conn.rb'

class Create

  def self.check_params?(form_inputs)
    ret_value = true
    form_inputs.each do |key, value|
        l = value.length unless value.is_a?(Integer)
        ret_value = false if (key == 'name' && value.gsub(/[^a-zA-Z \.']/,'').length != l)
        ret_value = false if (key == 'description' && value.gsub(/[^a-zA-Z0-9 \.']/,'').length != l)
        ret_value = false if (key == 'price' && !value.is_a?(Integer))
        ret_value = false if (key == 'capacity' && !value.is_a?(Integer))
    end
    ret_value
  end

  def self.add_space_to_db(form_inputs)
    table_columns = []
    table_values = []
    form_inputs.each do |key, value|
      table_columns << key.clean_key
      table_values << value.clean_value
    end
    db_connection = Connect.initiate(ENV["DB_IN_USE"])
    db_connection.exec("INSERT INTO spaces(#{table_columns.join(', ')}) VALUES(#{table_values.join(', ')}) RETURNING id")
  end

end
