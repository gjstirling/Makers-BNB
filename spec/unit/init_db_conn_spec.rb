require './db/init_db_conn.rb'

describe Connect do

  it "expects the connection to database to be live" do
    database_name = ENV["DB_IN_USE"]
    error = 'database "' << database_name << '" does not exist'
    expect{ described_class.initiate(database_name) }.not_to raise_error{ error }
  end

end