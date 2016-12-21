class MovieSerializer < ActiveModel::Serializer
  attributes :id, :title
  # belongs_to :director, serializer: MovieDirectorSerializer
  has_one :director
end
