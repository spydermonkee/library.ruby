require 'spec_help'

describe Book do
  it 'initializes as an instance of Book' do
    test_book = Book.new({"title" => "Harry Potter"})
    test_book.should be_an_instance_of Book
  end
  it 'should initialize with a title' do
    test_book = Book.new({"title" => "Harry Potter"})
    test_book.title.should eq "Harry Potter"
  end
  it 'saves the book to the database' do
    test_book = Book.new({"title" => "Harry Potter"})
    test_book.save
    Book.all.should eq [test_book]
  end
  it 'is the same book if it has the same name' do
    test_book1 = Book.new({"title" => "Harry Potter"})
    test_book2 = Book.new({"title" => "Harry Potter"})
    test_book1.should eq test_book2
  end
  it 'will have an id after you save it to the database' do
    test_book = Book.new({"title" => "Harry Potter"})
    test_book.save
    results = DB.exec("SELECT id FROM books WHERE title = '#{test_book.title}';")
    results.first['id'].to_i.should eq test_book.id
  end
  describe '.all' do
    it 'starts as an empty array' do
      Book.all.should eq []
    end
  end
end
