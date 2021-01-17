require 'rails_helper'

RSpec.describe Types::QueryType do
  describe 'query images' do
    it 'can query an image by id' do
      image = create(:image)
      require 'pry'; binding.pry
    end
  end


end