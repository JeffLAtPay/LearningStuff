class Monad
  attr_accessor :good, :okay, :bad
  
    def initialize good, okay, bad
      @good = good
      @okay = okay
      @bad = nil
    end
    
end