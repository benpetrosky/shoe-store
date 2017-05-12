require("spec_helper")


describe(Store) do
  it("validates presence of name") do
    store = Store.new({:name => ""})
    expect(store.save()).to(eq(false))
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
