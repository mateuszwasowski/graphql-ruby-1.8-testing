module Types
  class QueryType < Types::BaseObject
    description "Links to sites etc."
    field :links, [Types::LinkType], null: false, description: "gets all links"
    field :link, Types::LinkType, null: true do
      description "Find link by id"
      argument :id, ID, required: true
    end
    field :users, [Types::UserType], null: false, description: "gets all users"

    def links
      Link.all
    end

    def link(id:)
      Link.find(id)
    end

    def users
      User.all
    end
  end
end
