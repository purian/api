class Product < ActiveRecord::Base

  validates_presence_of :name, :sku, :category

end
