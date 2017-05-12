require("spec_helper")


describe(Store) do
  it("validates presence of name") do
    store = Store.new({:name => ""})
    expect(store.save()).to(eq(false))
  end
  it("assures that a store name entry is unique in the database") do
    store1 = Store.create({:name => "sams super shoe store"})
    store2 = Store.new({:name => "sams super shoe store"})
    expect(store2.save()).to(eq(false))
  end
  it("ensures the length of the store name is no more than 100 characters") do
    store = Store.new({:name => "a".*(101)})
    expect(store.save()).to(eq(false))
  end
    it("Capitalizes the first letter of every word in a store name") do
      store = Store.create({:name => "super shoe store for men"})

      expect(store.name()).to(eq("Super Shoe Store For Men"))
    end

  describe('#brands') do
    it('each store can have many brands') do
      store = Store.create({:name => "shoe mart"})
      brand1 = store.brands.create({:name => 'nike'})
      brand2 = store.brands.create({:name => 'addidas'})
      expect(store.brands()).to(eq([brand1, brand2]))
    end
  end
end
