Module Arraymon

  #Identity function
  I = lambda {|x| x }
  
  #Structure preserving transformaiton to apply the
  #given function across the whole environment.
  def map
    lambda {|f| bind[lambda {|x| sefl.class.unit[f[x]] }]}
  end
  
  #Joins nested monads into one environment by applying 
  #the ID function.
  def flatten
    bind[I]
  end
  
  def apply
    lambda {|x|  }
     
