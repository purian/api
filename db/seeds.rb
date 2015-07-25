
# Option for predefined categories
# CATEGORY = ["Beverages", "Condiments", "Confections", "Dairy Products", "Grains/Cereals", "Meat/Poultry", "Produce", "Seafood"] # Took from Northwind DB


# Secure way yo generate random alphanumeric strings
# sku_array = [] # Should insert here the generate sku after add it to a product record
#
# def generate_sku
#   self.token = loop do
#     random_token = Array.new(6){[*'0'..'9', *'A'..'Z'].sample}.join
#     break random_token unless sku_array.include?(random_token)
#   end
# end


# Drop products if exists
if Product.all.size > 0
  puts # Just for make the display prettier
  puts # Just for make the display prettier
  puts "Deleting all Products..."
  Product.delete_all
end
puts # Just for make the display prettier
puts # Just for make the display prettier
puts "Importing Products.."
progressbar = ProgressBar.create(:title => "Products", starting_at: 0, total: 1000)
1000.times.each do |index|
  sku = index.to_s.rjust(4, '0') + Array.new(4){[*'0'..'9', *'A'..'Z'].sample}.join
  Product.create(name: Faker::Commerce.product_name, sku: sku, category: Faker::Commerce.department)
  progressbar.increment
end
