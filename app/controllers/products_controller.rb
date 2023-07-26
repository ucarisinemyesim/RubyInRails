class ProductsController < ApplicationController
  #  controller page for adding,deleting and editing products. at editing part I did not put an option to change brand.

  before_action :find_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Products.all

  end

  def show
  end

  def new
    @product = Products.new
    @brands = Brands.all
  end


  def create
    product_params = params.require(:products).permit(:name, :brand_id)
    @product = Products.new(product_params)

    brand_id = product_params[:brand_id]
    @product.brand = Brands.find(brand_id) if brand_id.present?

    if @product.save
      redirect_to products_path, notice: "Ürün başarıyla oluşturuldu."
    else
      @brands = Brands.all
      render :new
    end
  end

  def update
    product_params = params.require(:products).permit(:name, :brand_id)

    brand_id = product_params[:brand_id]
    @product.brand = Brands.find(brand_id) if brand_id.present?

    if @product.update(product_params)
      redirect_to products_path, notice: "Ürün başarıyla güncellendi."
    else
      render :edit
    end
  end
  

  def edit
    @brand = Brands.find(params[:id])

  end


  def destroy
    @product.destroy
    redirect_to products_path, notice: "Ürün başarıyla silindi."
  end

  private

  def find_product
    @product = Products.find(params[:id])
  end
end
