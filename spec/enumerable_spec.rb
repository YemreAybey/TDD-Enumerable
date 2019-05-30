require './lib/enumarable'

RSpec.describe Enumerable do

    describe "#my_each" do

      it "returns array" do
        array = [1, 2, 3, 4]
        expect(array.my_each{ |num| puts num}).to eql(array)
      end

      it "returns error" do
       
        expect((1..3).my_each{ }).to eql((1..3))
      end

    end

end