require 'rails_helper'

RSpec.describe Types::QueryType do
  describe 'query images' do
    it 'can search images by keyword' do
      image_01 = create(:image, description: 'Dog running')
      image_02 = create(:image, description: 'Sleeping dog')
      image_03 = create(:image, description: 'Cat knocking things over')

      post graphql_path, params: { query: query }
      result = JSON.parse(response.body, symbolize_names: true)

      images = Image.where("description ILIKE ?", "%dog%")

      expect(result[:data][:searchImages].count).to eq(2)
      expect(result.dig(:data, :searchImages)).to match_array(
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
        searchImages(description: "dog") {
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
