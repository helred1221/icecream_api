class ProductsController < ApplicationController
        module Api
            module V1
              class ProductsController < ApplicationController
                before_action :set_product, only: %i[show update destroy]
          
                def index
                  products = ProductsFilter.retrieve_all
                  render json: products, status: :ok
                end
          
                def show
                  render json: @product, status: :ok
                end
          
                def create
                  product = Product.new(product_params)
          
                  if product.save
                    render json: product, status: :created
                  else
                    render json: { errors: product.errors.full_message }, status: :unprocessable_entity
                  end
                end
          
                def update
                  if @product.update(product_params)
                    render json: @product, status: :ok
                  else
                    render json: { errors: product.errors.full_message }, status: :unprocessable_entity
                  end
                end
          
                def destroy
                  @product.destroy
                  head :no_content
                end
          
                private
          
                def product_params
                  params
                    .require(:product)
                    .permit(:street, :house_number, :neighborhood, :city, :zip_code)
                end
          
                def set_product
                  @product = ProductFilter.find_by_id(params[:id])
                end
          
              end
            end
          end
    
end
