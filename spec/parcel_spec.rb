require('rspec')
require('parcel')

describe(Parcel) do
  describe("#volume") do
    it("Returns volume of parcel") do
      test_parcel = Parcel.new(3, 3, 4)
      expect(test_parcel.volume()).to(eq(36))
    end
  end
end
