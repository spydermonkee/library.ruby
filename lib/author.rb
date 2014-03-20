class Author

  attr_reader :first_name, :last_name, :id

  def initialize(attributes)
    @first_name = attributes['first_name']
    @last_name = attributes['last_name']
    @id = attributes['id']
  end

  def self.all
    results = DB.exec("SELECT * FROM authors;")
    authors = []
    results.each do |result|
      authors << Author.new(result)
    end
    authors
  end

  def save
    results = DB.exec("INSERT INTO authors (first_name, last_name) VALUES ('#{@first_name}', '#{last_name}') RETURNING id;")
    @id = results.first['id'].to_i
  end

  def ==(another_author)
    self.first_name == another_author.first_name && self.last_name == another_author.last_name
  end
end
