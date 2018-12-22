module Types
  class LinkType < Types::BaseObject
    field :id, ID, null: false
    field :url, String, null: false
    field :description, String, null: true
    field :user, UserType, null: true
    field :user_id, ID, null: true
    field :votes, [VoteType], null: true
  end
end
