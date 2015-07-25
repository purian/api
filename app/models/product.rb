# == Schema Information
#
# Table name: products
#
#  id         :integer          not null, primary key
#  name       :string
#  sku        :string
#  category   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Product < ActiveRecord::Base

  validates :sku, uniqueness: true
  validates_presence_of :name, :sku, :category

end
