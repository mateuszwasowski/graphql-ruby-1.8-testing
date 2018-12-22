module Types
  class VoteType < Types::BaseObject
    field :id, ID, null: true
    field :user, Types::UserType, null: true
    field :link, Types::LinkType, null: true
  end
end
