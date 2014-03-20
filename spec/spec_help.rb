require 'book'
require 'genre'
require 'author'
require 'patron'
require 'rspec'
require 'pg'


DB = PG.connect({:dbname => 'catalog_test'})

RSpec.configure do |config|
  config.before(:each) do
    DB.exec("DELETE FROM books")
    DB.exec("DELETE FROM genres")
    DB.exec("DELETE FROM authors")
    DB.exec("DELETE FROM patrons")
  end
end
