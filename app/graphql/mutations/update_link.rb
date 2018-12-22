module Mutations
  class UpdateLink < Mutations::BaseMutation
    null true

    argument :id, ID, required: true
    argument :description, String, required: true
    argument :url, String, required: false

    field :link, Types::LinkType, null: true
    field :errors, [String], null: false

    def resolve(id: ,description:, url:)
      link = Link.find(id)
      if link.update(description: description, url: url)
        {
          link: link,
          errors: [],
        }
      else
        {
          link: link,
          errors: link.errors.full_messages
        }
      end
    end
  end
end
