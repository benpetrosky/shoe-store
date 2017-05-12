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

get("/brands/new") do
  @brands = Brand.all()
  erb(:brands)
end

post('/brands') do
  name = params.fetch("name")
  price = params.fetch("price").to_i
  Brand.create(:name => name, :price => price)
  @brands = Brand.all()
  erb(:brands)
end

get("/stores/:id") do
  id = params.fetch("id").to_i
  @store = Store.find(id)
  erb(:store)
end

delete('/store_delete/:id') do
  id = params.fetch("id").to_i
  store = Store.find(id)
  store.delete()
  @stores = Store.all()
  erb(:stores)
end
