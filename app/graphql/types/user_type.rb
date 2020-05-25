class Types::UserType < Types::BaseObject
  graphql_name "User"

  field :id, ID, null: false
  field :name, String, null: false
  field :picture, String, null: true

end