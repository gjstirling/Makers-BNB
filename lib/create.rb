require 'pg'
require './lib/string.rb'
require './db/init_db_conn.rb'

class Create

  def self.check_params?(form_inputs)
    ret_value = true
    form_inputs.each do |key, value|
        l = value.length unless value.is_a?(Integer)
        ret_value = false if (key == 'name' && value.gsub(/[^a-zA-Z \.']/,'').length != l)
        ret_value = false if (key == 'description' && value.gsub(/[^a-zA-Z0-9 \.']/,'').length != l)
        ret_value = false if (key == 'price' && (!value.is_a?(Integer) || value <=0))
        ret_value = false if (key == 'capacity' && (!value.is_a?(Integer) || value <=0))
    end
    ret_value
  end

  def self.add_space(form_inputs)
    table_columns = []
    table_values = []
    form_inputs.each do |key, value|
        if ['name', 'description', 'price', 'capacity', 'user_id'].include?(key)
          table_columns << key # .clean_key
          table_values << value.clean_value
        end
    end
    db_connection = Connect.initiate(ENV["DB_IN_USE"])
    query = "INSERT INTO spaces(#{table_columns.join(', ')}) VALUES(#{table_values.join(', ')})"
    db_connection.exec(query)
  end

end
