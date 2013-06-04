require_relative '../newmon.rb'
require 'spec_helper'

describe Newmon do
  
  before :all do
    @f1 = lambda {|x| x + 1 }
    @arr = [1,2]
    @array = Newmon.new @arr
  end
  
  describe "#new" do
     
    it "should return a new Array monad class object." do
      @array.should be_an_instance_of Newmon
    end
    
    it "should throw an argument error if not passed an argument." do
      lambda { fail = Newmon.new }.should raise_exception ArgumentError
    end
  end
  
  describe "#arraywrap" do
    
   before do 
     @test = @array.each.bind(@f1)
   end
   
    it "should wrap a given value into an array" do
      @test.value.should == [2,3]
    end
  end
  
end
    





