class Author
  attr_reader :name, :books

  def initialize(author_name)
    @first_name = author_name[:first_name]
    @last_name = author_name[:last_name]
    @name = "#{@first_name} #{@last_name}"
    @books = []
  end

  def write(book_name, publication_date)
    book = Book.new({author_first_name: @first_name, 
    author_last_name: @last_name, 
    title: book_name, 
    publication_date: publication_date})
    @books << book
    book
    # helper method to format book
  end
end
