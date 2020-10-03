class CategoryController < ApplicationController
  before_action :set_category, only: :show

  def index
    @parents = Category.where(ancestry: nil)
  end

  def show
    children = @category.children
    grandchildren = []
    children.each do |child|
      grandchildren << Category.where(ancestry: "#{@category.id}/#{child.id}")
    end
    @categories = []
    grandchildren.each do |grandchild|
      grandchild.each do |id|
        @categories += Item.where(category_id: id)
      end
    end

      
    grandchildrens = children
    @child_categories = []
      
    grandchildrens.each do |grandchild|
      @child_categories += Item.where(category_id: grandchild.id)
    end

    @grand_categories = Item.where(category_id: params[:id]) 
  end

  private
def set_category
  @category = Category.find(params[:id])
  if @category.has_children?
    @category_links = @category.children
  else
    @category_links = @category.siblings
  end
end

end
