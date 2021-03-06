require_relative '../monad.rb'
require 'spec_helper'

describe Monad do
  
  before :each do
    @f1 = lambda {|x| x + 1  }
    @f2 = lambda {|x| x + 10  }
    @monad = Monad.new 0
  end
  
  describe "#new" do
     
    it "should throw an argument error if not passed a argument." do
      lambda { monad = Monad.new }.should raise_exception ArgumentError
    end
    
    it "should return a new Monad object" do
      @monad.should be_an_instance_of Monad
    end
    
    before do
      @chain = @monad.bind(@f1).bind(@f2)
    end
    
    it "should allow a monad's value to be passed around to diff functions." do
       @chain.value.should eql 11
    end
  end
end