module Types
  class QueryType < Types::BaseObject
    field :get_image, Types::ImageType, null: false, description: 'Returns a single image by id' do
      argument :id, ID, required: true
    end

    field :get_images, [Types::ImageType], null: false, description: 'Returns all images'

    field :search_images, [ImageType], null: false, description: 'Returns images based on keyword' do
      argument :description, String, required: false
    end

    def get_image(id:)
      Image.find(id)
    end

    def get_images
      Image.all
    end

    def search_images(description: nil)
      require 'pry'; binding.pry
      if description
        Image.where("description ILIKE ?", "%#{description}%").limit(10)
      else
        Image.all.limit(10)
      end
    end
  end
end
