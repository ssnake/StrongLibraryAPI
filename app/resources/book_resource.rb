class BookResource < JSONAPI::Resource
  attribute :title
  has_one :author
  filter :authors, apply: -> (records, value, opts) {
  	records.joins(:author).where("authors.first_name ilike ? or authors.last_name ilike ?", "#{value.first}%", "#{value.first}%")
  }
end