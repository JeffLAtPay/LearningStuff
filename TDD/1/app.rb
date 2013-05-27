require 'sinatra'
require 'sinatra/activerecord'

set :database, "sqlite3///blog.db"

class Post < ActiveRecord::Base
end

def reverse string
  string.each_char.to_a.reverse.join
end

get '/' do
  "Hello World"
end

post '/' do
  reverse params[:str]
end
