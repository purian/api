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

FactoryGirl.define do
  factory :product do
    name     { Faker::Commerce.product_name }
    category { Faker::Commerce.department }
    sku      { Array.new(8){[*'0'..'9', *'A'..'Z'].sample}.join }
  end
end
