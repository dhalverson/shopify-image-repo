class Types::Image < GraphQL::Schema::Object
  field :url, String, null: false
  field :name, String, null: false
  field :description, String, null: false
  field :category, String, null: false
end
