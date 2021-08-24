#!/usr/bin/env ruby
require 'pg'
require 'active_record'

class Connect 

  def self.db_create(dbname)
    PG.connect(dbname: 'postgres').exec("CREATE DATABASE IF NOT EXISTS #{dbname}")

  end

  def self.initiate(dbname)
    @dbname = dbname.to_s
    @dbname << '_test' if ENV['RACK_ENV'] == 'test'
    db_create(dbname) 
    PG.connect(dbname: dbname)
    
  end

end