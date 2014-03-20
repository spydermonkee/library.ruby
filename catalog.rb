require 'book'
require 'author'
require 'patron'
require 'genre'
require 'pg'

DB = PG.connect({:dbname => 'catalog'})

def welcome_menu
  puts 'Welcome to Literature Matrix 4.7
        Are you a patron or LIBRARIAN?
        Please enter "p"for patron or "l" for LIBRARIAN'
  destiny = gets.downcase.chomp
  case destiny
  when 'p'
    patron_menu
  when 'l'
    librarian_menu
  else
    'Goodbye'
  end
end

def patron_menu
  puts '
        OPTIONS:
                "c" to checkout books
                "h" to examine your Matrix history
                "s" to search the Literature Matrix catalog
                "x" to exit the system'
  destiny = gets.downcase.chomp
  case destiny
  when 'c'
    checkout
  when 'h'
    patron_history
  when 's'
    search_catalog_menu
  when 'x'
    puts 'Goodbye'
  else
  puts 'Not a valid choice'
  patron_menu

end






welcome_menu
