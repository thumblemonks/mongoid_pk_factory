require 'rubygems'
require 'riot'
require 'mongoid_pk_factory'
require 'riot/rr'

Mongoid.configure do |config|
  config.master = Mongo::Connection.new.db("mongoid_pk_factory_test")
end