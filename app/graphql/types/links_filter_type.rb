module Types
  class LinksFilterType < Types::BaseInputObject
    argument :OR, LinksFilterType, required: false
    argument :description_contains, String, required: false
    argument :url_contains, String, required: false
  end
end
