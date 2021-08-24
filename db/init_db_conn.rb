#!/usr/bin/env ruby
require 'pg'
require './db/init_db_tables.rb'

class Connect 

  def self.db_create(dbname)
    unless db_exists?(dbname)
      conn = PG.connect(dbname: 'postgres').exec("CREATE DATABASE #{dbname}")
    end
  end

  def self.db_exists?(name)
    # returns false if db is non-existant
    PG.connect dbname: name
  rescue PG::ConnectionBad => e
    false
  end

  def self.initiate(dbname)
    @dbname = dbname.to_s
    @dbname << '_test' if ENV['RACK_ENV'] == 'test'
    db_create(dbname)  
    PG.connect(dbname: dbname)  
  end

end