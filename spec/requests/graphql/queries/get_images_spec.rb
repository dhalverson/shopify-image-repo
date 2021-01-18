require 'rails_helper'

RSpec.describe Types::QueryType do
  describe 'query images' do
    it 'can query all images' do
      image_01 = create(:image, description: 'Dog running')
      image_02 = create(:image, description: 'Sleeping dog')
      image_03 = create(:image, description: 'Cat knocking things over')

      post graphql_path, params: { query: query }
      result = JSON.parse(response.body, symbolize_names: true)
      require 'pry'; binding.pry
      images = Image.all

      expect(result.dig(:data, :getImages)).to match_array(
        images.map do |image|
          {
            id: image.id.to_s,
            url: image.url,
            name: image.name,
            description: image.description,
            category: image.category
          }
        end
      )
    end
  end
  
  def query
    <<~GQL
      {
        getImages {
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
