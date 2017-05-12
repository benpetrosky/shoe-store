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
get("/stores") do
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
  @brands = Brand.all()
  @store_brands = @store.brands()
  erb(:store)
end

delete('/store_delete/:id') do
  id = params.fetch("id").to_i
  store = Store.find(id)
  store.delete()
  @stores = Store.all()
  erb(:stores)
end

patch('/store_update/:id') do
  id = params.fetch("id").to_i
  name = params.fetch("name")
  brand_ids = params.fetch("brand_ids", "")
  @brands = Brand.all()

  @store = Store.find(id)
  @store_brands = @store.brands()
  @store.update(:name => name)

  if brand_ids != ""
    brand_ids.each() do |brand_id|
      brand = Brand.find(brand_id)
      @store_brands = @store.brands.push(brand)
    end
  end
  erb(:store)
end
