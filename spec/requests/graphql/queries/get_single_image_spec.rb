require 'rails_helper'

RSpec.describe Types::QueryType do
  describe 'query images' do
    it 'can query an image by id' do
      image = create(:image)

      post graphql_path, params: { query: query(id: image.id) }
      result = JSON.parse(response.body, symbolize_names: true)

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
        getImage(id: #{id}) {
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
