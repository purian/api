class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :category, :sku, :created_at, :updated_at
end
