def Arraymonad
  attr_accessor :array
  
  def intialize
    @array = []
  end
  
  def unit value
    self.unit.new(value)
  end
  
  def bind function
    self.unit function.call(@array)
  end
end