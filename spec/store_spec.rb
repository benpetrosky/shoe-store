require("spec_helper")


describe(Store) do
  describe('#brands') do
    it('each store can have many brands') do
      store = Store.create({:name => "shoe mart"})
      brand1 = store.brands.create({:name => 'nike'})
      brand2 = store.brands.create({:name => 'addidas'})
      expect(store.brands()).to(eq([brand1, brand2]))
    end
  end
end
