class CategoriesController < ApplicationController

  def show
    #raise "here" #this is raising error rather than adding break point like puts or prints 
    @category = Category.find(params[:id])
    
    #raise Category.inspect # show error with data type 
    @products = @category.products.order(created_at: :desc)
  end

end
