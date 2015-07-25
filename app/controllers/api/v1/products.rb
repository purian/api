module API
  module V1
    class Products < Grape::API
      include API::V1::Defaults

      resource :products do
        desc "Return all products"
        get "", root: :products do
          page = (params[:page] || 1).to_i
          products = Product.page(page).per((params[:per_page] || 10).to_i)
          if params[:category_filter]
            products = products.where("lower(category) LIKE ?","#{params[:category_filter].downcase}%")
          end
          render products, :meta => {:total_pages => products.total_pages, :page => (params[:page] || 1).to_i}
        end

        desc "Return a product"
        params do
          requires :id, type: String, desc: "ID of the product"
        end
        get ":id", root: "product" do
          Product.where(id: permitted_params[:id]).first!
        end

        desc "Update a product"
        put ':id' do
          product = Product.where(id: params[:id]).first!
          product.name = params[:product][:name] if params[:product][:name]
          product.sku = params[:product][:sku] if params[:product][:sku]
          product.category = params[:product][:category] if params[:product][:category]
          product.save

          product
        end

      end
    end
  end
end