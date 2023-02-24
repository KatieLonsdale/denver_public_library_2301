class Author
  attr_reader :name, :books

  def initialize(author_name)
    @first_name = author_name[:first_name]
    @last_name = author_name[:last_name]
    @name = "#{@first_name} #{@last_name}"
    @books = []
  end

  def write

  end
end
