module Types
  class ImageType < Types::BaseObject
    field :id, ID, null: false
    field :url, String, null: false
    field :name, String, null: false
    field :description, String, null: false
    field :category, String, null: false
  end
end
