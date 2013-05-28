require 'sinatra'
require 'sinatra/activerecord'

set :database, "sqlite3://#{Dir.pwd}/blogg.db"

class Post < ActiveRecord::Base
end

def reload!
  exec $0, *ARGV
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
