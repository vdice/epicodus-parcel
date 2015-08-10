require('rspec')
require('parcel')

describe(Parcel) do
  describe("#volume") do
    it("Returns volume of parcel") do
      test_parcel = Parcel.new(3, 3, 4, 0, 'Standard', 0)
      expect(test_parcel.volume()).to(eq(36))
    end

    describe("#cost_to_ship") do
      it("Returns the cost to ship a standard package") do
        test_parcel = Parcel.new(2, 2, 2, 5, 'Standard', 3000)
        expect(test_parcel.cost_to_ship()).to(eq(32.5))
      end
      it("Returns the cost to ship an expedited package") do
        test_parcel = Parcel.new(4, 4, 4, 5, 'Expedited', 3000)
        expect(test_parcel.cost_to_ship()).to(eq(37.5))
      end
    end
  end
end
