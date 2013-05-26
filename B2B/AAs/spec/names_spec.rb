require 'spec_helper'

describe Name do
  
  before :each do         # :each test
    @name = Name.new "Name", "Code", :category 
  end
  
  describe "#new" do
    it "returns a new name object" do
      @name.should be_an_instance_of Name
  end
end
end
