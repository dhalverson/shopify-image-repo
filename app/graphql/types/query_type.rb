module Types
  class QueryType < Types::BaseObject
    field :get_image, Types::ImageType, null: false, description: 'Returns a single image by id' do
      argument :id, ID, required: true
    end

    field :get_images, [Types::ImageType], null: false, description: 'Returns all images'

    def get_image(id:)
      Image.find(id)
    end

    def get_images
      Image.all
    end
  end
end
