class Patron
  attr_reader :name, :id

  def initialize(attributes)
    @name = attributes["name"]
    @id = attributes["id"].to_i
  end

  def self.all
    results = DB.exec("SELECT * FROM patrons;")
    patrons = []
    results.each do |result|
      patrons << Patron.new(result)
    end
    patrons
  end

  def self.find_patron(patron_name)
    results = DB.exec("SELECT * FROM patrons WHERE name = '#{patron_name}';")
    patron = Patron.new(results.first)
  end

  def save
    results = DB.exec("INSERT INTO patrons (name) VALUES ('#{@name}') RETURNING id;")
    @id = results.first['id'].to_i
  end

  def ==(another_patron)
    self.name == another_patron.name && self.id == another_patron.id
  end
end
