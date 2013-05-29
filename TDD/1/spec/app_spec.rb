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
  
  it "should show 404 messaging." do
    post "/no_real_route_404_message"
    last_response.body.should not_be ok?
  end
end

describe 'About tests' do
  include Rack::Test::Methods
  
  it "should load the about page" do
    get '/about'
    last_response.body.should be_ok
  end
end

    

