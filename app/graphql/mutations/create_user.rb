module Mutations
  class CreateUser < Mutations::BaseMutation
    null true

    argument :name, String, required: true
    argument :auth_provider, Types::AuthProviderEmailInputType, required: true

    field :user, Types::UserType, null: true
    field :errors, [String], null: false

    def resolve(name:, auth_provider:)
      user = User.new(
        name: name,
        email: auth_provider[:email],
        password: auth_provider[:password],
      )

      if user.save
        {
          user: user,
          errors: [],
        }
      else
        {
          user: user,
          errors: user.errors.full_messages
        }
      end
    end
  end
end
