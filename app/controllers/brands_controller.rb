 class BrandsController < ApplicationController
#  controller page for adding,deleting and editing brands
  def index
    @brands = Brands.all
    @brands.each do |brand|
      brand.products = Products.all.select { |product| product.brand_id == brand.id }
    end
  end

   def new
     @brand = Brands.new
     @brands = Brands.all
     puts @brands.inspect

   end

   def create
     brand_params = params.require(:brands).permit(:name)
     @brand = Brands.new(brand_params)
     @brand.save
     redirect_to brands_path
   end
  
   def edit
     @brand = Brands.find(params[:id])
   end

   def update
     @brand = Brands.find(params[:id])
     @brand.update(brand_params)
     redirect_to brands_path
   end

   def destroy
     @brand = Brands.find(params[:id])
     @brand.destroy
     redirect_to brands_path
  end

   private

   def brand_params
     params.require(:brands).permit(:name)
   end
      def find_brand
     @brand = Brands.find(params[:id])
   end

end
