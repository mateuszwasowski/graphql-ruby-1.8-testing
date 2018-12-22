module Types
  class QueryType < Types::BaseObject
    description "Links to sites etc."
    field :all_links, [Types::LinkType], null: false, description: "Returns all links"

    def all_links
      Link.all
    end
  end
end
