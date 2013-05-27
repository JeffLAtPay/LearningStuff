require_relative '../app.rb'

require 'rack/test'

set :environment, :test

def app
  Sinatra::Application
end

describe 'Index response and 404 tests:' do
  include Rack::Test::Methods
   
  it "should load the home page" do
    get '/'
    last_response.should be_ok
  end
  
  it "should reverse posted values" do
    post '/', params = { :str => 'Jeff'}
    last_response.body.should == 'ffeJ'
  end
  
  it "should load the 404 page" do
    get '/undefined_route'
    last_response.should_not be_ok
  end
  
end
