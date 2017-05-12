
ENV['RACK_ENV'] = 'test'

require("rspec")
require("pg")
require("sinatra/activerecord")
require("./lib/brand")
require("./lib/store")

RSpec.configure do |config|
  config.after(:each) do
    Store.all().each do |store|
      store.destroy()
    end
    Brand.all().each do |brand|
      brand.destroy()
    end
  end
end
