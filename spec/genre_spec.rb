require 'spec_help'

describe Genre do

  describe '.initialize' do
    it 'initializes a ganre with a name' do
      this_genre = Genre.new({'name' => 'Horror'})
      this_genre.should be_an_instance_of Genre
    end
  end

  describe '.all' do
    it 'gathers the collection of genres found in the database' do
      this_genre = Genre.new({'name' => 'Horror'})
      this_genre.save
      that_genre = Genre.new({'name' => 'Mystery'})
      that_genre.save
      other_genre = Genre.new({'name' => 'Comedy'})
      other_genre.save
      Genre.all.length.should eq 3
    end
  end

  describe '#save' do
    it 'saves a genre to the database' do
      this_genre = Genre.new({'name' => 'Horror'})
      this_genre.save
      results = DB.exec("SELECT * FROM genres WHERE id = #{this_genre.id};")
      results.first['id'].to_i.should eq this_genre.id
    end
  end
  describe
end
