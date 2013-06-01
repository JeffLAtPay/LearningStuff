require_relative '../monad.rb'
require 'spec_helper'

describe Monad do
  
  before :each do
    @monad = Monad.new "Good", "Okay", nil 
  end
  
  describe "#new" do
    it "should return a new Monad object" do
      @monad.should be_an_instance_of Monad
    end
  end
  
end

