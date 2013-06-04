class Newmon 
  attr_reader :value
  
    def initialize value
      @value = value
    end

    def unit value
       self.class.new [value]
    end
  
    def bind function
      self.unit value.map {|value| function.call(@value)}.flatten 
    end
end


     
