require 'spec_help'

describe Author do
  author1 ={"first_name" => "Stephen", "last_name" => "Frost"}

  it 'initializes as an instance of Author with a first name and last name' do
    test_author = Author.new(author1)
    test_author.first_name.should eq "Stephen"
    test_author.last_name.should eq "Frost"
  end
  it 'saves the author to the database' do
    test_author = Author.new(author1)
    test_author.save
    Author.all.should eq [test_author]
  end
   it 'is the same author if it has the same first and last name' do
    test_author1 = Author.new(author1)
    test_author2 = Author.new(author1)
    test_author1.should eq test_author2
  end
  it 'will have an id after you save it to the database' do
    test_author = Author.new(author1)
    test_author.save
    results = DB.exec("SELECT id FROM authors WHERE first_name = '#{test_author.first_name}' AND last_name = '#{test_author.last_name}';")
    results.first['id'].to_i.should eq test_author.id
  end
end
