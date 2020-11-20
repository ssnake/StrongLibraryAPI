class AuthorResource < JSONAPI::Resource
  attribute :first_name
  attribute :last_name
  has_many :books
  filters :first_name, :last_name
end