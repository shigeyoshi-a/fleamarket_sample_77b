class CategoryController < ApplicationController
  before_action :set_category, only: :show

  def index
    @parents = Category.where(ancestry: nil)
  end

  def show
    #親要素の子要素代入
    children = @category.children
    grandchildren = []
    children.each do |child|
      grandchildren << Category.where(ancestry: "#{@category.id}/#{child.id}")
    end
    @categories = []
    # grandchildrenは（１子要素の孫要素、２子要素の孫要素）という多重配列なのでeach文を二回重ねることで親要素の全ての孫要素のidをwhereメソッドに渡しています。
    grandchildren.each do |grandchild|
      grandchild.each do |id|
        @categories += Item.where(category_id: id)
      end
    end

      #子要素の孫要素代入
    grandchildrens = children
    @child_categories = []
      #子要素の孫要素という一つの配列なのでeach文は一度で孫要素のid取得
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
