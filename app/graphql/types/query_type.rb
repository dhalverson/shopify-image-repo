module Types
  class QueryType < Types::BaseObject
    field :get_image, Types::ImageType, null: false, description: 'Returns a single image by id' do
      argument :id, ID, required: true
    end

    def get_image(id:)
      image = Image.find(id)
    end
  end
end
