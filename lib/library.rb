class Library
 attr_reader :name, :books, :authors, :checked_out_books

 def initialize(name)
  @name = name
  @books = []
  @authors = []
  @checked_out_books = []
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

  def check_out_book(book)
    if @checked_out_books.include?(book)
      return 'Already checked out.'
    else
      book.check_outs += 1
      @checked_out_books << book
    end
  end

  def return_book(book)
    @checked_out_books.delete(book)
  end

  def most_checked_out_book
    ordered_by_check_outs = @books.sort_by{|book| book.check_outs}
    ordered_by_check_outs.last.title
  end
end
