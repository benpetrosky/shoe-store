require("spec_helper")


describe(Brand) do
  describe('#stores') do
    it('each brand can have many stores') do
      brand = Brand.create({:name => "nike"})
      store1 = brand.stores.create({:name => 'shoe mart'})
      store2 = brand.stores.create({:name => 'shoe depot'})
      expect(brand.stores()).to(eq([store1, store2]))
    end
  end
end
