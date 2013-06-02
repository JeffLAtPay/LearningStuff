class Monad
  attr_reader :value
  
    def initialize value
      @value = value
    end
    
    def unit value
      self.class.new value
    end
    
    def bind function
      self.unit function.call @value
    end
end

f1 = lambda { |x| x*4 }
f2 = lambda { |x| x/2 }

monad = Monad.new(5).bind(f1).bind(f2)
puts monad.value