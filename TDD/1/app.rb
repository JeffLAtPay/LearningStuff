require 'sinatra'
require 'sinatra/activerecord'

class Post < ActiveRecord::Base
end

def reverse string
  string.each_char.to_a.reverse.join
end

get '/' do
  "Hello Joey!"
end

post '/' do
  reverse params[:str]
end
