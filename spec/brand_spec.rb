require("spec_helper")


describe(Brand) do
  it("validates presence of name") do
    brand = Brand.new({:name => ""})
    expect(brand.save()).to(eq(false))
  end
  it("assures that a brand name entry is unique in the database") do
    brand1 = Brand.new({:name => "addidas"})
    brand1.save()
    brand2 = Brand.new({:name => "addidas"})
    expect(brand2.save()).to(eq(false))
  end
  it("Capitalizes the first letter of every word in a brand name") do
    brand = Brand.create({:name => "nike"})
    expect(brand.name()).to(eq("Nike"))
  end
  it("ensures the length of the brand name is no more than 100 characters") do
    brand = Brand.new({:name => "a".*(101)})
    expect(brand.save()).to(eq(false))
  end
  describe('#stores') do
    it('each brand can have many stores') do
      brand = Brand.create({:name => "nike"})
      store1 = brand.stores.create({:name => 'shoe mart'})
      store2 = brand.stores.create({:name => 'shoe depot'})
      expect(brand.stores()).to(eq([store1, store2]))
    end
  end
end
