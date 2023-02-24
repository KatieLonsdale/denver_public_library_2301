require './spec_helper'

RSpec.describe Library do
  before(:each) do
    @library = Library.new('Bemis Public Library')
  end
  describe '#initialize' do
    it 'exists' do
      expect(@library).to be_a Library
    end

    it 'has a name' do
      expect(@library.name).to eq('Bemis Public Library')
    end
  end
end