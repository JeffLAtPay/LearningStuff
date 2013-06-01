require 'sinatra'

  def reload!
    exec $0, *ARGV
  end  

  get '/' do
    "Hello World"
  end

  post '/' do
    reverse params[:str]            
  end                               
                                  
  get '/about' do
    "The framework for everything." 
  end
  
  not_found do
    halt 404, 'Page not found.'
  end
  
  