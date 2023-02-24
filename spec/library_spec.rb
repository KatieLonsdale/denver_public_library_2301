require './spec_helper'

RSpec.describe Library do
  before(:each) do
    @library = Library.new('Bemis Public Library')
    @charlotte_bronte = Author.new({
      first_name: "Charlotte", 
      last_name: "Bronte"})
  end
  describe '#initialize' do
    it 'exists' do
      expect(@library).to be_a Library
    end

    it 'has a name' do
      expect(@library.name).to eq('Bemis Public Library')
    end

    it 'has an empty array of books by default' do
      expect(@library.books).to eq([])
    end

    it 'has an empty array of authors by default' do
      expect(@library.authors).to eq([])
    end

    # checked out books
  end

  describe '#add_author' do
    it 'adds author to authors array' do
      @library.add_author(@charlotte_bronte)

      expect(@library.authors).to eq([@charlotte_bronte])
    end

    it 'adds authors books to books array' do
      jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
      villette = @charlotte_bronte.write("Villette", "1853")
      @library.add_author(@charlotte_bronte)

      expect(@library.books).to eq([jane_eyre, villette])
      expect(villette.author).to eq('Charlotte Bronte')
      expect(villette.title).to eq('Villette')
      expect(villette.publication_year).to eq('1853')
    end
    # try with multiple authors and books
  end

  describe '#publication_time_frame_for' do
    it 'returns hash with start and end year of given authors books' do
      jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
      villette = @charlotte_bronte.write("Villette", "1853")
      @library.add_author(@charlotte_bronte)

      expect(@library.publication_time_frame_for(@charlotte_bronte)).to be_a Hash
      expect(@library.publication_time_frame_for(@charlotte_bronte)).
      to eq({:start => '1847', :end => '1853'})
    end
  end

  describe '#check_out_book' do
    it 'adds given book to checked out books' do
      jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
      villette = @charlotte_bronte.write("Villette", "1853")
      @library.add_author(@charlotte_bronte)

      @library.check_out_book(jane_eyre)

      expect(@library.checked_out_books).to eq([jane_eyre])
      # mutiple books
      # can't be checked out if already checked out
    end
  end

  describe '#return_book' do
    it 'removes given book from checked out books' do
      jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
      villette = @charlotte_bronte.write("Villette", "1853")
      @library.add_author(@charlotte_bronte)

      @library.check_out_book(jane_eyre)
      @library.return_book(jane_eyre)

      expect(@library.checked_out_books).to eq([])
    end
  end

  describe '#most_checked_out_book' do
    it 'returns book that has been checked out most times' do
        jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
        villette = @charlotte_bronte.write("Villette", "1853")
        @library.add_author(@charlotte_bronte)
  
        @library.check_out_book(jane_eyre)
        @library.check_out_book(villette)
        @library.return_book(jane_eyre)
        @library.check_out_book(jane_eyre)

        expect(@library.most_checked_out_book).to eq('Jane Eyre')
    end
  end
end