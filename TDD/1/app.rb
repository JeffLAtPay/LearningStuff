require 'sinatra'

  def reload!
    exec $0, *ARGV
  end

  get '/' do
    "Hello World"
  end

  post '/' do
    reverse params[:str]            # needs HTML post input 
  end                               # from the root URL path.
                                  # Can use to run tests.
  get '/about' do
    "The framework for everything." 
  end
  
  