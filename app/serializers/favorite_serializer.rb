class FavoriteSerializer < ActiveModel::Serializer
  attributes :id, :name, :user_id
  has_one :cut
end
