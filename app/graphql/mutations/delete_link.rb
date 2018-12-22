module Mutations
  class DeleteLink < Mutations::BaseMutation
    null true

    argument :id, ID, required: true

    field :link, Types::LinkType, null: true
    field :errors, [String], null: false

    def resolve(id:)
      link = Link.find(id)
      link.destroy

      {
        link: link,
        errors: [],
      }
    end
  end
end
