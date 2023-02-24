class Library
 attr_reader :name, :books, :authors

 def initialize(name)
  @name = name
  @books = []
  @authors = []
 end

 def add_author(author)
  @authors << author
  author.books.each{|book| @books << book}
 end

 def publication_time_frame_for(author)
  ordered_books = author.books.sort_by{|book| book.publication_year}
  time_frame = {start: ordered_books.first.publication_year, 
                end: ordered_books.last.publication_year}
  end
end
