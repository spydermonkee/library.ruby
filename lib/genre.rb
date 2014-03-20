class Genre
  attr_reader :name, :id

  def initialize(attributes)
    @name = attributes['name']
    @id = attributes['id']
  end

  def self.all
    results = DB.exec("SELECT * FROM genres;")
    genres = []
    results.each do |result|
      genres << Genre.new(result)
    end
    genres
  end

  def save
    results = DB.exec("INSERT INTO genres (name) VALUES ('#{@name}') RETURNING id;")
    @id = results.first['id'].to_i
  end

end
