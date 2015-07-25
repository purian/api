module API
  module V1
    class Products < Grape::API
      include API::V1::Defaults

      resource :products do
        desc "Return all products"
        get "", root: :products do
          Product.all
        end

        desc "Return a product"
        params do
          requires :id, type: String, desc: "ID of the product"
        end
        get ":id", root: "product" do
          Product.where(id: permitted_params[:id]).first!
        end
      end
    end
  end
end