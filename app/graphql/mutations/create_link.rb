module Mutations
  class CreateLink < Mutations::BaseMutation
    null true

    argument :description, String, required: true
    argument :url, String, required: false

    field :link, Types::LinkType, null: true
    field :errors, [String], null: false

    def resolve(description:, url:)
      link = Link.new(description: description, url: url)
      if link.save
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
