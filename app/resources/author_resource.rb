class AuthorResource < JSONAPI::Resource
  attribute :first_name
  attribute :last_name
  has_many :books

  filter :first_name, apply: -> (records, value, opts) {
  	records.where("first_name ilike ?", "#{value.first}%")
  }

  filter :last_name, apply: -> (records, value, opts) {
  	records.where("last_name ilike ?", "#{value.first}%")
  }

end