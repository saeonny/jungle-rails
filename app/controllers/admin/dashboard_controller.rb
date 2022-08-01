class Admin::DashboardController < ApplicationController
  def show
    @totalProducts = Product.count
    @totalCatergory = Category.count
  end
end
