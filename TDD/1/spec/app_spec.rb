require_relative '../app.rb'
require 'rack/test'

set :environment, :test

def app
  Sinatra::Application
end

describe 'Homepage tests:' do
  include Rack::Test::Methods
   
  it "should load the home page" do
    get '/'
    last_response.should be_ok
  end
  
  it "should reverse posted values" do
    post '/', params = { :str => 'Jeff'}
    last_response.body.should == 'ffeJ'
  end
  
end
