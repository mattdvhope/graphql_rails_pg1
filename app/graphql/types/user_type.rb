module Types
  class UserType < Types::BaseObject
    graphql_name "User"

    field :id, ID, null: false
    field :name, String, null: false
    field :picture, String, null: false
  end
end
