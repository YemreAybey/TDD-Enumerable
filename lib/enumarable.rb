module Enumerable

    def my_each
      if self.is_a? Array
        for i in 0...self.length
          yield self[i]
        end
      elsif self.is_a? Hash
        for key in self.keys
          yield key, self[key]
        end
      else
        return "You can't use my_each method on #{self.class} class"
      end
      self
    end
    
    def my_each_with_index
      index = 0
      if self.is_a? Array
        for i in 0...self.length
        yield self[i], i
        end
      elsif self.is_a? Hash
        for key in self.keys
        yield [key, self[key]], index
        index += 1
        end
      else
        return "You can't use my_each_with_index method on #{self.class} class"
      end
      self
    end
    
    def my_select
      if self.is_a? Array
        resA = []
        self.my_each do |element|
          case yield element
            when true then del << element
          end
        end
      elsif self.is_a? Hash
        res = {}
        self.my_each do |key, element|
          case yield key, element
            when true then res[key]= element
          end
      end
      else
        return "You can't use my_select method on #{self.class} class"
      end
      res
    end
    
    def my_all?
      if self.is_a? Array
        self.my_each do |element|
          case yield element
            when false then return false
          end
        end
      elsif self.is_a? Hash
        self.my_each do |key, element|
          case yield key, element
            when false then return false
          end
        end
      else
        return "You can't use my_all? method on #{self.class} class"
      end
      true
    end
    
    def my_any?
      if self.is_a? Array
        self.my_each do |element|
          case yield element
            when true then return true
          end
        end
      elsif self.is_a? Hash
        self.my_each do |key, element|
          case yield key, element
            when true then return true
          end
        end
      else
        return "You can't use my_any? method on #{self.class} class"
      end
      false
    end
    
    def my_none?
      if self.is_a? Array
        self.my_each do |element|
          case yield element
            when true then return false
          end
        end
      elsif self.is_a? Hash
        self.my_each do |key, element|
          case yield key, element
            when true then return false
          end
        end
      else
        return "You can't use my_none? method on #{self.class} class"
      end
      true
    end
    
    def my_count(num = nil)
      counter=0
      if num == nil
      if self.is_a?(Array) && block_given?
        self.my_each do |element|
          case yield element
            when true then counter += 1
          end
        end
      elsif self.is_a?(Hash) && block_given?
        self.my_each do |key, element|
          case yield key, element
            when true then counter += 1
          end
        end
      elsif self.is_a?(Array) && !block_given?
        return self.length
      elsif self.is_a?(Hash) && !block_given?
        return self.keys.length
      else
        return "You can't use my_count? method on #{self.class} class"
      end
    else
      if self.is_a? Array
        self.my_each do |element|
          case num == element
            when true then counter += 1
          end
        end
      elsif self.is_a? Hash
        self.my_each do |key, element|
          case element == num 
            when true then counter += 1
          end
        end
      else
        return "You can't use my_count? method on #{self.class} class"
      end
    end
      counter
    end
    
    def my_map(proc="default")
      result = []
      if self.is_a? Array
        if proc.is_a? Proc
          self.my_each do |element|
            result << proc.call(element)
          end
        elsif proc == "default"
          self.my_each do |element|
            result << yield(element)
          end
        else
          return "U need to pass a proc"
        end
  
      elsif self.is_a? Hash
        if proc.is_a? Proc
          self.my_each do |key,element|
            result << proc.call(key, element)
          end
        elsif proc == "default"
          self.my_each do |key, element|
            result << yield(key, element)
          end
        else
          return "U need to pass a proc"
        end
      else
        return "You can't use my_map method on #{self.class} class"
      end
      result
    end
    
    def my_inject(acc="undefined")
      temp = self
      if self.is_a? Array
        if acc == "undefined"
          acc = self[0]
          temp = self[1..-1]
        end
        temp.my_each do |element|
          acc = yield(acc, element)
        end
      elsif self.is_a? Hash
        if acc == "undefined"
          acc = self[self.keys[0]]
          temp.delete(temp.keys[0])
        end
        temp.my_each do |key, element|
          acc = yield(acc, key, element)
        end
      else
        return "You can't use my_inject method on #{self.class} class"
      end
      acc
    end
    
      def multiply_els
        self.my_inject {|acc, num| acc*num}
      end
    
    end
  
    array = [1, 2, 2, 2]
    puts array.my_count {|num| num > 1}