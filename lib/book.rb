class Book
  attr_reader :title, :author, :publication_year
  attr_accessor :check_outs

  def initialize(info)
    @author = "#{info[:author_first_name]} #{info[:author_last_name]}"
    @title = info[:title]
    @publication_year = extract_year(info[:publication_date])
    @check_outs = 0
  end

  def extract_year(date)
    @publication_year = date.split.last
  end
end
