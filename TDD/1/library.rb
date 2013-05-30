require 'yaml'

class Library
  attr_accessor :books
  
  def initialize lib_file = false
    @lib_file = lib_file
    @books = @lib_file ? YAML::load(File.read(@lib_file)) : []
  end
  
  def get_books_in_category category
    @books.select do |book|
      book.category == category
    end
  end
  
  def get_books_by_author author
    @books.select do |book|
      book.author == author
    end
  end
  
  def get_book title
    @books.select { |book| book.title == title }.first
  end
  
end