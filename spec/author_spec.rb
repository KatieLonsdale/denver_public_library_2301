require './spec_helper'

RSpec.describe Book do
  before(:each) do
    @charlotte_bronte = Author.new({
      first_name: "Charlotte", 
      last_name: "Bronte"})
  end

  describe '#initialize' do
    it 'exists' do
      expect(@charlotte_bronte).to be_a Author
    end

    it 'has a name' do
      expect(@charlotte_bronte.name).to eq('Charlotte Bronte')
    end

    it 'has an array of books that is empty by default' do
      expect(@charlotte_bronte.books).to eq([])
    end
  end

  describe '#write' do
    it 'create an instance of book' do
      jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
      
      expect(jane_eyre).to be_a Book
      expect(jane_eyre.author).to eq('Charlotte Bronte')
      expect(jane_eyre.title).to eq('Jane Eyre')
      expect(jane_eyre.publication_year).to eq('1847')
    end
  end
end
