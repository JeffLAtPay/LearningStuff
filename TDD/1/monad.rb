class Monad
    def initialize value
      @v = value
    end
    
    def unit value
      self.class.new value
    end
    
    def bind function
      self.unit function.call @v
    end
end

