class Book

attr_reader :title, :id

  def initialize(attributes)
    @title = attributes['title']
    @id = attributes['id']
  end

  def self.all
    results = DB.exec("SELECT * FROM books;")
    books = []
    results.each do |result|
      books << Book.new(result)
      end
    books
  end

  def save
    results = DB.exec("INSERT INTO books (title) VALUES ('#{@title}') RETURNING id;")
    @id = results.first['id'].to_i
  end

  def ==(another_book)
    self.title == another_book.title
  end

end
