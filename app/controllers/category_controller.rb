class CategoryController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @categories =  @category.items
  end
end
