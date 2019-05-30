require './lib/enumarable'

RSpec.describe Enumerable do

    describe "#my_each" do
      it "returns array" do
        array = [1, 2, 3, 4]
        expect(array.my_each{ |num| puts num}).to eql(array)
      end

      it "returns hash" do
        hash = {a: 1, b: 2}
        expect(hash.my_each{ |key, value|  key}).to eql(hash)
      end

      it "returns range" do       
        expect((1..3).my_each{ }).to eql((1..3))
      end

    end

    describe "#my_inject" do
      it "takes the first value when nothing is passed as parameter" do
        array = [1, 2, 3, 4]
        expect(array.my_inject { |acc, value| acc + value}).to eql(10)
      end

      it "takes a parameter" do
        array = [1, 2, 3, 4]
        expect(array.my_inject(1) { |acc, value| acc + value}).to eql(11)
      end

      it "takes a string as parameter returns the string multiply by number" do
        array = [1, 1, 1, 2]
        expect(array.my_inject("neer") { |acc, value| acc * value}).to eql("neerneer")
      end

    end

end