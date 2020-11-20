class BookResource < JSONAPI::Resource
  attribute :title
  has_one :author
end