require 'spec_helper'

describe "Library Object" do
    
    before :all do
        lib_arr = [
          Book.new("Ender's Game","Card", :scifi),
          Book.new("The Great Gatsby","Fitzgerald", :classic),
          Book.new("Oryx and Crake","Attwood", :scifi),
          Book.new("A Legacy of Ashes: The History of the CIA","Weiner", :nonfiction),
          Book.new("Children of the Mind","Card", :scifi)
        ]
  
        File.open "books.yml", "w" do |f|
            f.write YAML::dump lib_arr
        end
    end
  
    before :each do
        @lib = Library.new "books.yml"
    end
    
    describe "#new" do
        context "with no parameters" do
            it "has no books" do
                lib = Library.new
                lib.should have(0).books
            end
        end
        
        context "with a yaml file name parameter" do
            it "has 5 books" do
                @lib.should have(5).books
            end
        end
    end
    
    it "returns all the books in a given category" do
      @lib.get_books_in_category(:scifi)
    end
    
    it "returns all books by an author" do
      @lib.get_books_by_author("Card").length == 2
    end
    
    it "gets a book by the title" do
      @lib.get_book("Ender's Game").title.should eql "Ender's Game"
    end
    
    it "accepts new books" do
      @lib.add_book(Book.new("One Fish, Blue Fish", "Suess", :kids) )
      @lib.get_book("One Fish, Blue Fish").should be_an_instance_of Book
    end
  
end