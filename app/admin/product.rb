ActiveAdmin.register Product do

  permit_params :id, :name, :sku, :category, :created_at, :updated_at

end
