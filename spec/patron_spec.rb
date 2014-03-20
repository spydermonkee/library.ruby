require 'spec_help'

describe Patron do
  describe 'initialize' do
    it 'initializes a Patron with a name' do
      this_patron = Patron.new({'name' => 'Billy Boggs'})
      this_patron.name.should eq "Billy Boggs"
      this_patron.should be_an_instance_of Patron
    end
  end
  describe '#save' do
    it 'saves the patron to the database' do
      this_patron = Patron.new({"name" => "Billy Biggs"})
      this_patron.save
      results = DB.exec("SELECT * FROM patrons WHERE id = #{this_patron.id};")
      results.first['id'].to_i.should eq this_patron.id
    end
  end
  describe '.all' do
    it 'should return all of the patrons in an array' do
      this_patron = Patron.new({"name" => "Billy Ray"})
      this_patron.save
      that_patron = Patron.new({"name" => "Billy Hay"})
      that_patron.save
      other_patron = Patron.new({"name" => "Billy Day"})
      other_patron.save
      Patron.all.length.should eq 3
    end
  end
  describe 'find_patron' do
    it 'will return the id when given the patron name' do
      this_patron = Patron.new({"name" => "Billy Ray"})
      this_patron.save
      that_patron = Patron.new({"name" => "Billy Hay"})
      that_patron.save
      other_patron = Patron.new({"name" => "Billy Day"})
      other_patron.save
      Patron.find_patron("Billy Ray").should eq this_patron
    end
  end
end
