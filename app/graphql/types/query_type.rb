module Types
  class QueryType < Types::BaseObject
    description "Links to sites etc."
    field :links, [Types::LinkType], null: false, description: "gets all links" do
      argument :filters, Types::LinksFilterType, required: false, default_value: {}
      argument :skip, Integer, required: false, default_value: nil
      argument :first, Integer, required: false, default_value: nil
    end

    field :link, Types::LinkType, null: true do
      description "Find link by id"
      argument :id, ID, required: true
    end
    field :users, [Types::UserType], null: false, description: "gets all users"

    def links(filters:, skip:, first:)
      scope = Link.all

      branches = normalize_filters(filters).reduce { |a, b| a.or(b) }
      scope.merge(branches).offset(skip).limit(first)
    end

    def normalize_filters(filters, branches = [])
      # add like SQL conditions
      scope = Link.all
      scope = scope.where('description LIKE ?', "%#{filters.description_contains}%") if filters.description_contains
      scope = scope.where('url LIKE ?', "%#{filters.url_contains}%") if filters.url_contains

      branches << scope

      # continue to normalize down
      filters.or.reduce(branches) { |s, v| normalize_filters(v, s) } if filters.or

      branches
    end

    def link(id:)
      Link.find(id)
    end

    def users
      User.all
    end
  end
end
