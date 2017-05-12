require('sinatra')
require('sinatra/reloader')
require('sinatra/activerecord')
also_reload('lib/**/*.rb')
require('./lib/brand')
require('./lib/store')
require('pry')
require("pg")

get("/") do
  erb(:index)
end

get("/stores/new") do
  @stores = Store.all()
  erb(:stores)
end

post('/stores') do
  name = params.fetch("name")
  Store.create(:name => name)
  @stores = Store.all()
  erb(:stores)
end
