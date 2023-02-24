class Book
  attr_reader :title, :author, :publication_year

  def initialize(info)
    @author = "#{info[:author_first_name]} #{info[:author_last_name]}"
    @title = info[:title]
    @publication_year = extract_year(info[:publication_date])
  end

  def extract_year(date)
    @publication_date = date.split.last
  end
end
