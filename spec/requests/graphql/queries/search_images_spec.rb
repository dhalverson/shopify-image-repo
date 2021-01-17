require 'rails_helper'

RSpec.describe Types::QueryType do
  describe 'query images' do
    it 'can search for images by description' do
      image_01 = create(:image, description: 'Dog running')
      image_02 = create(:image, description: 'Dog running')
      image_03 = create(:image, description: 'Dog running')

      post graphql_path, params: { query: query(id: image.id) }
      result = JSON.parse(response.body, symbolize_names: true)

      images = Image.all
      require 'pry'; binding.pry
      expect(result.dig(:data, :getImage)).to eq({
        id: image.id.to_s,
        url: image.url,
        name: image.name,
        description: image.description,
        category: image.category
      })
    end
  end
  
  def query(id:)
    <<~GQL
      {
        searchImages{
          id
          url
          name
          description
          category
        } 
      }
    GQL
  end
end
