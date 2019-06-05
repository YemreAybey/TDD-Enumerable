require './lib/enumarable'

describe Enumerable do
    let(:array) { [1, 2, 3, 4] }
    let(:hash) { {a: 1, b: 2} }
    let(:hash1) { {a: "apple", b:"banana"} }

    describe "#my_each" do
      it "returns array" do
        expect(array.my_each{ |num| num}).to eql(array)
      end

      it "returns hash" do
        expect(hash.my_each{ |key, value|  key}).to eql(hash)
      end

      it "returns range" do       
        expect((1..3).my_each{ }).to eql((1..3))
      end

    end

    describe "#my_inject" do
      it "takes the first value when nothing is passed as parameter" do
        expect(array.my_inject { |acc, value| acc + value}).to eql(10)
      end

      it "takes a parameter" do
        expect(array.my_inject(1) { |acc, value| acc + value}).to eql(11)
      end
        
      it "works on hash" do
        expect(hash.my_inject { |acc, key, value| acc * value}).to eql(2)
      end

      it "works on hash when passed parameter" do
        expect(hash.my_inject(2.5) { |acc, key, value| acc * value}).to eql(5.0)
      end

      it "works on hash when passed string parameter" do
        expect(hash.my_inject("yem") { |acc, key, value| acc * value}).to eql("yemyem")
      end

    end

  describe "#my_select" do
    it "works on array" do
      expect(array.my_select{ |num| num > 2}).to eql([3, 4])
    end

    it "works on hash" do
      expect(hash.my_select{ |key, value| value > 2}).to eql({})
    end

    it "works on empty hash" do
      hash = {}
      expect(hash.my_select{ |key, value| value > 2}).to eql({})
    end

    it "works on string values" do
      expect(hash1.my_select{ |key, value| value.length > 5}).to eql({b: "banana"})
    end
  end

  describe "my_any? method" do
    it "should return true if it find the true value in array" do
      expect(array.my_any? { | num | num > 3}).to eql(true)
   end 

   it "should return true if it find the true value in hash" do
      expect(hash1.my_any? { | key, value | value.length > 3}).to eql(true)
   end 

   it "should return false if it does not finds true value" do
      expect(array.my_any? { | num | num > 4}).to eql(false)
   end 

   it "should return false when not passed a block" do      
      expect(array.my_any? { }).to eql(false)
   end    
  end
 
  describe "my_all? method" do
    it "should return false if it finds the false true value in array" do
      expect(array.my_all? { | num | num > 3}).to eql(false)
    end 
    
    it "should return false if it finds the false true value in hash" do
      expect(hash1.my_all? { | key, value | value.length > 3}).to eql(true)
    end 

    it "should return false if it finds nil value in array" do
      arr = [nil, false, false]
      expect(array.my_all? { | num | num == false}).to eql(false)
    end 

  end  

  describe "my_none? method should " do
    it "should return false if there is one true situation in Array" do
      expect(array.my_none? { | num | num > 2}).to eql(false)
    end 

    it "should return false if one true situation in hash" do
      expect(hash1.my_none? { | num, value | value.length > 2}).to eql(false)
    end 

  end

end