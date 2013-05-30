require_relative '../app.rb'
require 'rack/test'
require 'spec_helper'

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
  
  it "should show 404 messaging." do
    post "/no_real_route_404_message"
    last_response.should_not be_ok
    last_response.body.should == 'Page not found.'
  end
end

describe 'About tests' do
  include Rack::Test::Methods
  
  it "should load the about page" do
    get '/about'
    last_response.should be_ok
    last_response.body.should == "The framework for everything."
  end
end

    

