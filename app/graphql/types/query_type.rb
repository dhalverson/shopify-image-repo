module Types
  class QueryType < Types::BaseObject
    field :get_image, Types::ImageType, null: false, description: 'Returns a single image by id' do
      argument :id, ID, required: true
    end

  end
end
