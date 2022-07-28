class ProductsController < ApplicationController

  def index
    #use MODEL to fatch or creater
    @products = Product.all.order(created_at: :desc)
    # VIEW : indext.html.erb
    #render :index
  end
  
  #this is the action that referenced 
  #render as the action of the function name
  def show
    #magically render this variable 
    @product = Product.find params[:id]
    #render :show
    #render 'show'
  end

end

# produnt#index call this 
