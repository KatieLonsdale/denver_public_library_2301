class Author
  attr_reader :name, :books

  def initialize(author_name)
    @name = "#{author_name[:first_name]} #{author_name[:last_name]}"
    @books = []
  end
end
