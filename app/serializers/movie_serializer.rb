class MovieSerializer < ActiveModel::Serializer
  attributes :id, :title, :description
  # belongs_to :director, serializer: MovieDirectorSerializer
  has_one :director
end
