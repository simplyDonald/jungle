class CategoriesController < ApplicationController

  def show
    @category = Category.find(params[:id])
    @products = @category.products.order(created_at: :desc)
  end
  def index
    @categories = Category.order(id: :desc).all
  end
end
